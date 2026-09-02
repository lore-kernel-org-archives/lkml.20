Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB3930E85B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331007; cv=none; b=H8MZj5NFKSg6lSOKRZMTZ7BP9eAv73aKaYknBLhVAhCBQcWn2kqGN9WrSQD5m/h+NRiXUC9nUlFbMUtfxqn0tlkHZmIPdY0VF7qzJjAY3Ha085n0P3TvBhJpJRpCrLj1EM0w9SESLUMz4ZU4WQc456XkhUkEgXhPA35SXCpEiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331007; c=relaxed/simple;
	bh=YwH9ABw/DM5LWNp+iWqHtTnGq3exluZ0De94TCsyzWw=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=Rr2Iul3Od3pw5JIWEZVUygqWyey33AeRw3Min6QZUPE2E8gbteZWfCWUeAkyloBjmaNSzSDWgALFr/+8dGqd3CYuZz/IGE9tCoJimqFQzvO79w+bmHcuAbf+PVAWWjOTRgZw7SvBAV/h7g907ZgXuyUtVyvTJLNT6SOEjNScYN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=w1/cV5p3; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="w1/cV5p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788330995; bh=YwH9ABw/DM5LWNp+iWqHtTnGq3exluZ0De94TCsyzWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=w1/cV5p3fsE5UuV9zjWetDpZ3ykeGTxz26kwZTtizs8ljbBrAabwHRj1iD/IrvXyL
	 0y3G94zRTzKzU+v50bwN2czAT3j6+Z7ax+X+PPqs0DT4tCIxC4JeREn4MdHv56kuaW
	 AHbDu9ahCvo8HtprJA6l5o17VCx6yPHOkDeSEsHc=
Received: from localhost ([58.240.122.156])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8D5AE878; Wed, 02 Sep 2026 14:35:21 +0800
X-QQ-mid: xmsmtpt1788330921tfwguak9h
Message-ID: <tencent_BD8B7DCB7F9C5B07D7EDF04E47DE1F41A208@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0C0RtcQUTbRaXR+/SrHTTmTaLeaKKyUG76GETP49CR7iM9aOyiYr
	 z/lHjInZ/qyrDzNHVbd+LPoea2AUlKHvWUTQeYElUSvxB4MLbk0XSlsJ7Sa/9czd3TI4J20Ru+YO
	 ScGs9Ji2fCX8CsIuunCIgcB4aaiuhpWVYrVUfiogvl9EB5tRupaFPo9NdfK5Jj3ahHB0m5BSRz72
	 GzU5/umsJMtqifR0iaHA10oePvH5gmHtKDWhkaytzrPHa/1HXnSuVLSmc67HyqOY713XqTXLwdfq
	 JynDa+P5UnWYx8DlN9GGHqXcMe3m6utGeTvmW498c1/gmSSYHHCwsQXA+WWq7TAzhZcj8xyaeXc+
	 rMGJNCHHY1wm9zNj4BmEyPAi1mGKfrJAkmx0iDcl2lAHany4i4DDkriGftMRefUN4BvFwOg1qLBW
	 +M0/YcwlOrHt8/MZJqlv9jFbWgWCjP+vclwWpXSJm4gsyziXivaHxCrR3YwJljYuuqll/TK7GKJS
	 YwYVKXtMD6Zw6c43drrFQFlHJBaNa84wULKaBK4if5gk3cHmu6su5Lm7cs9nmQRI9qr2ZFOa6bWg
	 yOH7D5TYkw1qGAOyftoDp/GyDgGb2xUNXdRa/N3kPzYq79GNvJgEsbwjxVn1WoDF4QSL96j+03Ga
	 4Bkc4dDWGZ6JklNPjSvsngHsSr85+CSz1gC1RIjdAWbS5tUPf/ORaO4RLx4lMC6eFCQu2HgEDHwm
	 WQh//+zqYpQJ5YcIB5eQK7cQLVpSpJ8hdY0ZSV2wX8rIeTYP+uRmMNXbs3sza5sHt79Qz6Gxup+Q
	 6qFU/sYhVv/duQg8m/kbh29CWd+32dVr5vcXOmOzZT5HwGq+BpVzQkG8ZtEb31KcSa9Ys9vf8MFB
	 UaHJe+egqpLn32gIT6HrhCzxzLh5AtX6NoIZrPDktpPHEHAiM7oKJFJLZfiC7paMfs94qMikIQVh
	 eumCxbdJXJGgU0BgA9hwuuL9kQympreXAte8PGIeOzsWNBFL6GxEs/B7hTeP7pt9ckLt/iIN4u5J
	 Sda3pdG3wdHN7l8o02XB9oKvRRgsON1aIfZQ21BMHWIuy3qfSOs2B6CCp6u0lT1Ec6DfeB4Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
Date: Wed, 2 Sep 2026 14:35:21 +0800
From: Zhengping Zhang <aquapinn@qq.com>
To: ryder.lee@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	zhengping.zhang@airoha.com, lei.dong@airoha.com, hui.ma@airoha.com,
	upstream@airoha.com
Subject: Re: [PATCH] PCI: mediatek: Find INTx controller by property
X-OQ-MSGID: <apfDqZZJv7PN8cBu@PC24010019>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>
References: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>

Hi all,

Gentle ping on this patch:

[PATCH] PCI: mediatek: Find INTx controller by property

This patch has been pending since August 5. Could a maintainer or
reviewer please take a look when you have time?

Thanks,
Zhengping

