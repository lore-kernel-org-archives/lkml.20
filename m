Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586BE33A9DA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.248.49.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909530; cv=none; b=TyuvlE4UDjEvHNoUX58UHQdyVgx2MMZ4hOvHYdTQNuigkWPYJ7CY7ASi+wlZRxa0EEfW72g+3LMZ/k7mvXi855cx2s5OZhFXz/qznReAx8V7uubOlTB7X2rWoAZDaJQxg9gukNdl3W51/OfwUtIJjXppsnqtALL9R8whzwiHHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909530; c=relaxed/simple;
	bh=n7tkgjhCREXXPotubte9yx5zv2v+KTxj9Htm5oKfjso=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=u7S0cyTrl3/pN7XkcnDA2lTF3jcj6uLi2G/hgOk+D6BjL+MXROAFuIeLrrvTlImQr8zk6YFaKbqUKhWynqe/H+u/IGOBlKbaAfm57HRzk54IOe/TWOnGQNrldGNx+aFRWmkRMjUH0CwzLlK78q6ijvBPVG6HX9WQI87qsZM5hDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com; spf=pass smtp.mailfrom=socionext.com; arc=none smtp.client-ip=202.248.49.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 02 Oct 2026 11:52:01 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id ED4B5206807C;
	Fri,  2 Oct 2026 11:52:00 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Fri, 2 Oct 2026 11:52:00 +0900
Received: from [10.212.247.157] (unknown [10.212.247.157])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 5ADFF10D843;
	Fri,  2 Oct 2026 11:52:00 +0900 (JST)
Message-ID: <2b18d52b-a245-4c7d-abb2-622cd3cea428@socionext.com>
Date: Fri, 2 Oct 2026 11:51:59 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Peter Yin <peteryin.openbmc@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [REGRESSION] i3c: dw: Duplicate I2C client registration
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I found a regression due to commit f26ecaa0f0ab
("i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter").

If an I2C device is described as a child device of a DesignWare I3C
controller, the I2C client will be double instantiated after this commit.

The sequence appears to be:

1. device_set_of_node_from_dev() assigns the OF node of the I3C controller
    to the virtual I2C adapter.

2. i2c_add_adapter() then detects the OF node and instantiates the I2C child
    node through the normal I2C OF path.

3. The same child node has already been parsed by the I3C core and added to
    master->boardinfo.i2c.

4. i3c_master_i2c_adapter_init() then calls i2c_new_client_device() again
    for the same device again and fails with -EBUSY.

For example, I see the following error:
>    i2c i2c-4: Failed to register i2c client ptn5110 at 0x50 (-16)

Without commit f26ecaa0f0ab, i2c_add_adapter() will not instantiate any child
nodes because the virtual I2C adapter has no OF nodes.
The client is successfully instantiated from master->boardinfo.i2c as before.

After applying commit f26ecaa0f0ab, the client instantiated in the first path
(via i2c) is registered and functional. In my case, it is successfully bound to
the tcpci driver.
However, the second registration fails with -EBUSY, and i2cdev->dev is set to
ERR_PTR(-EBUSY) instead of valid I2C client.

I originally reproduced this on v6.12.y, and I have also confirmed the duplicate
client instantiation on v7.2.

The OF node is necessary for the purpose of commit f26ecaa0f0ab, but the I3C core
also needs to properly handle I2C devices written under the I3C controller,
and I'm not sure what the proper fix is.

I'd like to report the regression and the duplicate enumeration of child devices.
If this issue has already been reported or discussed, please disregard this report.

Thanks,

---
Best Regards
Kunihiko Hayashi
