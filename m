Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257192;
	b=V3pvnYQUcf4Hfh4ZWxm6EHJyXPklMLRWA/LkCL6XU1GScWrWpSSc9h97f6ClKpq3n7DN
	 rpSIHrOHXLYW5LZ0sfQlLBG/8GA9IQdXd7/qqNEEhcvHQRlYv8jzY4fU8Ao92Bj15S/BQ
	 UOJq4iZsI0GQk8N/EJ5g6YR96C1AUT+8JHGcGzqsW+pad4afG5EieCJT2zVFGE0V+cGOu
	 D/Y86KW0DYamGWq5PWa6d3TNhV53ndbl8i8B4GAEOO7NA0z0XWWe2j/9dhLY3Wix2DirH
	 1lpAXSlAL9spfH7iFZsnY5605rMF+Tib3pxVZzsF7Qmymh8qXJwv/zePZYZJfSski5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257192;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Kh6fyYM9A3q0ohWlsJcJ/n23PnS3m9HxS4zy/xnmjAA=;
	b=PKqimAlA6bLknHHYx44EPH3PVFGPK4Y76pw2Ncqh6D6DwExmgx8kKcp0+ZwmwUVR4LxI
	 ngwTq45HBUnW4ASvJuj+EwsaAP/0+r8JB0Xl0d0kwVTlTpPhpC3yDroOXLRPkfKpLUXMk
	 tkooUXZ0AnMyP1HalSWuCv1CciCn4K6U0C4k3zwN/AleQMI16eCR8vh2yitLuZqXwToxo
	 tzYb3oMaxGOIJq+ZLaz3q2q+qhIvlKBrFlXpXCA3ITgzRymzHw41dobfXDK2JG8OXtbHo
	 oNUun1fJZs7/mbwdnjyIyXv7MQUbFKPtYMz7cK1ZYb4a8VNcdRS6mqWpe/UXt7GWzyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X0xPqkDR;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D45D606A31A;
	Thu, 29 Oct 2026 06:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D45D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=X0xPqkDR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	MIME-Version; bh=Kh6fyYM9A3q0ohWlsJcJ/n23PnS3m9HxS4zy/xnmjAA=;
	b=X0xPqkDRu438dSh+eexVUHKzriBscbwvdl09W0lKduWsPgkR/kZMNkh33j58Xi
	ydOGXKml8sAP7Z/G5l8ndZA7zXKFw7Il7iBVAo8R5olnweMhF1WvkQlspWMnB3SC
	nM16XdCbrr84U9ghCceXTOY/cx25BYRHk+MWUz1T2fXsI=
Received: from [127.0.1.1] (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnHjPa7uJqqPNeAA--.374S2;
	Thu, 29 Oct 2026 14:59:38 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bryan O'Donoghue <bod@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
Date: Thu, 29 Oct 2026 14:59:38 +0800
Message-ID: <179325717815.489400.16602455641444097904@mail.ustc.edu.cn>
In-Reply-To: <5d886ac3-4baf-49c7-a703-7cb737ef48da@nxsw.ie>
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
X-CM-TRANSID:3pYKCgCnHjPa7uJqqPNeAA--.374S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1rKr4UZFW5Wr4DZF1xuFg_yoWfZFg_u3
	9rAr92ga1qvrn3Wa1DuF4q9rn8tw1ft3s8Wr4kXw1Ik34qyFs5Was2kw1Sqr4fXry09rnx
	G39Ygay09r909jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU5GhFDUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVYsUAASsl

Answering the open points in one message, short.

1. Kaanapali camss v23 (20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com)
   covers what our series tried to do, and its CSID patch already does the
   reg_update/addr_update split. We are dropping our binding, CSIPHY, CSID 980,
   VFE gen4 and DTS patches; no parallel submission from us on those files.

2. Frame start reporting: agreed, CSID should not be the reporter. Dropping that
   patch and looking at V4L2_EVENT_FRAME_SYNC on our side first.

3. Three patches we still think stand alone, none SM8750-specific and none
   touching files v23 touches:
   - media: camss: video: stop already-started subdevices when start fails
   - media: camss: csid: unwind power-on on failure
   - media: camss: video: require DMA-contiguous buffers (with the citation you
     asked for, or dropped)

   We will post them as a small series after rebasing on v23. No dates promised.

