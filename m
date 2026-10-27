Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077854;
	b=ACEd10svJElNBpLBD48aVD7Yr8gBMmHeYs705xaczL+Oqoifnpc8GItRHbSMUCTblV3o
	 NeXbpgFibb4gx9cb6bYmK/UKxGhChxPFtCeOvuCT06KEfLzdoibZv1YU1L/fwdgVfNDSL
	 MMsH/cO2lN5CeeIK6p8yHwCtQT44j1UKpmRq+uqzdjLKlfX6Gxzb4LtaooVcUyxzY2tH0
	 I2UFbnWw9A0chLcETTLAwYaUIDhxbDjjphs+NOg+pI8PLLuiuh6zJ9cpOLD27OjxuzrY9
	 CwOgj2G0mhsbLMIvpokyT8vD6WpiRQZjRbaZJ7vtYwL+BwCZDFS7t06yXjpeaE+1RRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077854;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=qpBTS8OJ6g8qVo1ig0Ake84aZGeymVgjtXacHWc7L1k=;
	b=Yw043PG8vbUERfyOULHikzrjTeREyU22SGDkM7CGuZqx4K17LCRfQKyZ8kyyVjPyJypp
	 73sJXwZwhQHH4InPq9ciUuN8gJmN2xoyjTJDjRP4nuJSVlXX/PfA++edUn5mQy99uMQ0z
	 smP6rDbVKWJUuArVBINzh3Boug6G0tXCJou7zh6uJlzMzz5RBKDyDy5goa8mZXAGvudl4
	 Dm0rCyQ42hLbUcZGnFjmcJTgIXZvPa5RxCxw3hQH5tNpqjM8YyOAqiwUL4NiMooqNVrsv
	 oZfQSmfTGoTOo/n/935sSNhy8W0MaHiVNKOW73p7TDB74DJkHfTDU1dVJs85v9ZW7Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=B9VitxV3;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60972606A31A;
	Tue, 27 Oct 2026 05:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60972606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=B9VitxV3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=qpBTS8OJ6g
	8qVo1ig0Ake84aZGeymVgjtXacHWc7L1k=; b=B9VitxV3miAKrSDFa3922d4je5
	MDRd5p/J6s+b0kViJobaEZ5dKH+FHsuEEKeoHVA96TvvCmd+tpsy98u2F1llFVAU
	3PkHc0c3wV9A2u8+lG6Om7dUrvY1OmJvhYEe9fF8VzrlQeDQnBhyxpemgXhJ0bYU
	jV1vF2+kEJcYt5mVY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3szdYMuBqJIhOAA--.1146S2;
	Tue, 27 Oct 2026 13:10:48 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: media: i2c: add GT9764 VCM and S5KJNS sensor
Date: Tue, 27 Oct 2026 13:10:46 +0800
Message-ID: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgA3szdYMuBqJIhOAA--.1146S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jr1UJw47Ar43Gr1rGw48JFb_yoW8JrWDpa
	yqgas8AFZ8KF12vrZ3Xw10qr1fZa1fAFWUGFy3Xw1rX3yUJry3tryFkw1q9FyDGw18WFy7
	XFWYgr4fG3WDu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU86uWPUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARENB2rfqlYHDgA1sv

Two small camera-side DT bindings for an SM8750 based tablet (Lenovo
Legion Tab, TB322FC): the Giantec GT9764 VCM driver IC and the Samsung
S5KJNS image sensor.  The two devices sit on the same I2C bus and are used
together on that board, but the bindings themselves are independent, so
they are sent as one small series to keep the DT review together.

Each patch adds a schema only, plus its MAINTAINERS entry.  The
corresponding "media: i2c" driver patches (gt9764 VCM and s5kjns sensor)
will be posted as separate series; the bindings in this series are the ones
those drivers and the device DTS will reference.

Both schemas pass dt-doc-validate, and both patches are clean under
checkpatch.pl --strict.


Qianhui Xu (2):
  dt-bindings: media: i2c: add Giantec GT9764 camera lens actuator
  dt-bindings: media: i2c: add Samsung S5KJNS image sensor

 .../bindings/media/i2c/giantec,gt9764.yaml    |  71 +++++++++++
 .../bindings/media/i2c/samsung,s5kjns.yaml    | 120 ++++++++++++++++++
 MAINTAINERS                                   |  12 ++
 3 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9764.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjns.yaml

-- 
2.53.0

