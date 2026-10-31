Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417955;
	b=X+OjTrKcvRMncgcNJTmnXoCvmVivdK4iw8+UinNXiMU8gXZt7Xntr0Vc3IvRu4XSwYYT
	 iNgGlMvMY1Opb2gdPgoKwn+izO5FBKowsbrmEwdyc5GePD8OGTcRm+nXR9AmiSRY9LmcU
	 77JKNd2d744yYyuXMAeyJ2ICsJZdJi5/osVwSFtYHkGvM/OT/fd6Nhm5tZEFYvY/VgKdc
	 6QKJ1aCpdVgaRyhM2DvEVP8NIRYsKOUkGj1SOA56mQoshi1XqRcHKehohqB+1fE9S+bU6
	 GJnPM5X8mMHkmEghUd0x5118RlwalG6hVjtvZoG6Du2lL8ZptwlXshhIjo6AIbJUHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417955;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=L/p52lX/PQbmqaF+6AAwWsvywExDSWVo6NSUa2HEi6k=;
	b=1z/h9ZMvWV9AuoXZRl7T1i4rLFvjUADdXAMWnU/2tJKlTz/7HOEvmi4gNwQNVjhtm5Bu
	 LyMColum03v94ihUNHwPM+H09LWkB+idc8qMB6nhNuR5zHJsarri7cRzheXP8nE2fQRv7
	 14Z9h3bQ2gZUyE4sfvdoxy5N+VFUTE4ofuXlsG5LyZqP5viFVHLXneeVc6VdJBOnZuVjq
	 gMi2L0Gfvf2S9+Z5CXgFWXMjbQaOE8Ma2FOqRh+ejWisuKecdW8FTdR6eDvriuCwpliBG
	 llYQtILRHW9Vuc3KsQ8rdG9MSmGHdebRqnRzsgdO89Sd/Kg3Nv4Ar1iBTmr0LMpX5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=tTGi52ye;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF652606A31A;
	Sat, 31 Oct 2026 03:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF652606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=tTGi52ye
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=L/p52lX/PQbmqaF+6AAwW
	svywExDSWVo6NSUa2HEi6k=; b=tTGi52yeRdJHnXpEhsMl2EELPHe33eaAjfN5R
	CF/X1BUQpCwqY5KnC/BQWuV0k6llDEOzBngApUQOQDkrp7cn2KTzEEMmyyPmkr6I
	5t5j38qk5+oX7ScF7KYXJzNzGyFy6Xv7SpgIYvZ7amfJmny1CViW7n7ZdygS6ar8
	JPPuhs=
Received: from [127.0.1.1] (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnIDXUYuVq_+lsAA--.3682S2;
	Sat, 31 Oct 2026 11:39:01 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: willsemi,wl2868c: add the
 WL2868C camera PMIC
Date: Sat, 31 Oct 2026 11:39:00 +0800
Message-ID: <179341794086.262379.12925109262126624772@mail.ustc.edu.cn>
In-Reply-To: <20261029-amiable-loutish-wolf-60a76a@quoll>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029-amiable-loutish-wolf-60a76a@quoll>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgCnIDXUYuVq_+lsAA--.3682S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWUXw15tF4rZr17Ary8Grg_yoW5GFWfpF
	Z0gFy8trs7KFy8C34kX3W8Za4Ivws3G3y5Za45Gr45Zan8CaySyr4ftr45ZrW7WryrGa1a
	yrnFgrnxCF1vqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkI
	ecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	ZB_UUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAasY

Hi Krzysztof,

one thing about the earlier replies before the technical part.  I am the
author of this series, but I work on this board alone and my English is
not good enough to write upstream mail unaided, so I draft with an AI
assistant and edit it myself; the content, measurements and decisions are
mine.  You were right that the earlier replies read like generated text.

1) "Looks like broken patch. Please use git or b4 to generate patches."
   The fault was in the commit message, not the diff: I had typed a
   diffstat into the body, so the mail carried two.  Since v2 the patches
   are real commits on pristine v7.3-rc7, exported with git format-patch.

2) "where is any user of this? Why do we want this binding?"
   The users are in patch 3/3, the board DTS for the Lenovo Legion Tab
   (TB322FC, SM8750): eight "*-supply = <&camera_ldoN>" references, rear
   s5kjns dvdd/dovdd/avdd = ldo1/ldo7/ldo4, front gc08a8 = ldo2/ldo7/ldo3,
   rear gt9764 VCM vdd/vddio = ldo5/ldo7.  LDO7 feeds three, LDO5 one,
   LDO1 to LDO4 one each; LDO6 is not wired out.  These are the camera
   subsystem's own rails, without them the sensors cannot be described, and
   they match the vendor DTS.  You saw no users because I sent the binding
   alone; v3 sends the three together.

3) "That's LLM output. Why do you paste it?", and your longer comment that
   the reply was generated text.
   Those points are fixed in v3: MAINTAINERS reads "WILLSEMI WL2868C CAMERA
   PMIC" (no driver claim), sorted between WIIMOTE and WILOCITY, and
   linux-media is dropped from its list.

4) "Please respond to comments from previous version."  Done here and in
   the v3 cover letter, together with Mark's v1 comments.

5) "I still see no users of this binding."  See 2).  If you would rather
   review the users first, say so and I will reorder the series.

Measured on v7.3-rc7, rebuilt from the patch files alone: checkpatch
--strict 0 errors in all three (3/3 has 5 warnings: the three sensor/lens
compatibles below, one MAINTAINERS false positive, one "DT binding docs
should be a separate patch" for a qcom.yaml line); dt-doc-validate and
dt-check-style rc=0; the board DTB builds rc=0 with no DTC errors (v2 died
with 15 phandle errors from the missing clocks), the only remaining dtc
warnings being pre-existing in sm8750.dtsi; dt-validate on it rc=0, 7 lines
left, all missing s5kjns / gc08a8 / gt9764 bindings; driver W=1 clean.

Gaps I know of: vin12/vin34/vin5..7-supply are not wired in the board DTS
yet, so the driver falls back to dummy supplies; enable_time and
max_register come from the vendor driver only; nothing is measured on
hardware beyond boot.

Thanks for reading.
Qianhui Xu

