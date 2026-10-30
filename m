Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377257;
	b=V0wnfzIcpujIsvf6Z2AlPWWZskAbbGLGIhQmP+UEtBFNXyEI6lTPluff4Z/z7b5kLov1
	 KxWFWSken8dPkZ3/N56Wa4+OJlKNWy3CHKVAb+FwdLB5mrkwI2/qhcUanshjzIThOmLlK
	 a+hT8IU9w66kc1qgeEo5bjvRXGMLcOCYuBLjFsCV6EShQeCf28CYKfF2xIQlVdl3hcfu3
	 7m5mrpeRG274x3aydB+5aPpjEPDbD0dpNJnV1h9PVtcp5A/n6MiZCxEqYokInGVMAl1dq
	 dYZ6iWB/dxc0sW+WQzQYkeN+nea6fitPDK5GtWMWqbJTvVAs/RrA8z+gA9rjJ1GMEuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
	b=p59MDoniW2HCQNnUSaVGeFXec4FeTzwHEGWz9pH8TTmAJp2+6+hiVlXtfDCNOoEGo1jH
	 hAsl4MFUf+O/wvUpWJ9LmQS0Xl25cmxil1jTGgzCuhcT3zY5P6MRoy+zhFb/m8/H4GibJ
	 H4++0i9ywOfDHhfqIk+SWOZLvkxGkwjCD2R3fo8Rv6NgEW6b6Eugw/nuzvg4Ad3sQwsBp
	 HxyAccaQYLyQyrDSx7Cg8ug5tuK/i0h1AyX6f+Tfi4m4Fs7TR3vdMQkpTtpDnqPjSDrXT
	 6uYmLX9+fPUkd3l0kELabu5jQsSVFCJ6n26NmOmYUO8e6sHpW9sjvIvJCiDLLbm/cxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uht1v+iq;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85EC606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uht1v+iq
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49de8ea072cso447465fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377255; x=1793982055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=Uht1v+iqUJcWRZy06lwzLvcycSp6R6ozrVk/cVPLZXcERt85Pa3iVcTSb6bidQj9yb
         CsicUJaZ2QEEWuHIiAbylCAVphtR3IvLOu3kmmaVcvTb+t8qqSWsXLcssLNBZrT22ObE
         SAe9SyQaEGj2OUQ61YgWh2SO/u8UxB6st6HBNiD+SyLtU0WussPppr4UB1nHhDHFeE4I
         x9rGrZgRyqBndsxZXqGeOsSb7c1hMYauxWSuZsDHZDfh5Ji3QSue7CXi3UNc1ZTAFy8A
         97SEtdP65b9DU8HEKj2yqLKNu/Xpx7DURZBtnTZ4YTZSlSDsgG359BWbjP5C9sLfD0es
         LoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377255; x=1793982055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=DciA6qVWp6O+BjUBwP5zNBploWu/qHBUlmbfmWhCPDBjNMGIYKHSuf3IrpTp/iXGOa
         E6GB7G6baDFDYJcwWUs8BsRQAu7R+lBVEqtlDTLDEuFj6PN2xE747JxUEWSiKjpkPrSK
         qnS9apjExGIsCaVdEHTYjaZ9ystDMCTfvP9ntUQCuCTibcKofKHeCRB0Hu4aIP3Lp4lD
         W3qNVUT0afQuwUH9tDe+3Rl0eUoHwrSDA7i8fNCUZbdjzQtqj47d+K97Orv3vSGR3aeK
         BOojLRnLjxodnAI0qFftwqm3HQA/7PNMYzkDsdO9nRkNV7kEi+G7wsNJS1pVx5FVOx7h
         NQqA==
X-Forwarded-Encrypted: i=1; AKwUvBxun5bW7UE53DQAapGLtrn4qJ+SCOhSeHUrJ6fIh/uoMnTEeQW8GXc08hEYupY0RZhYOsRIA2a+Z67PnBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6ZKQj4eOSXnWLhePxB9uSzXNsaRJvwo+E17ioepPSEF+OyREw
	atuXUHWYRl0IYTszZJpY9NbFxgT5s665AKj7zMoPMzCVFPvqg8FUfoB6
X-Gm-Gg: AYBFou1FhgFLUS8bAIruNWos2XI5R/g0f38fabuDbzngiG3VW0sGlrk1gN2NYQThXIJ
	8+ZrBbf08b7VTiMT57KRhkbl6jNm8t1uDV5v+5xumbZwuwkrlc6oX41gJ9BA5Tw+EGtSi8pEO/U
	V9R5KqqkqhkfXPc4o3ESzUT+Nv66xfpQcSCIug4zWgS/pACRi85X/KQS09ukhz6kvfbeg6O6RKb
	qg8Udy7DLlHm6YN7u0snmZBSbA5xS9h2GbtzklF652Q35j6d/ezGY3YgpcBqkJYzkTnc4kNYsiL
	N22EmXVeYvJHHdwd8PgnQoXWrs5ZiyhLZVMSDhsvNi+ZQGFUEtPJHiD1f3tLHVMeRUeZlMASXOR
	JSyUtUMgV7tkm5mqhLZP9CE4n+/i0GMXx5M640Em8s7kpURynEd1dQeyZszl0Er+a6Nye3I6wLe
	2sJeGxoL/T688x6dfJZbGNf4tqKOcdCg8cCIDwVHajF5e7U++FDTXhk+BRTVXXDkvbefw2Ij8LT
	BhXR/Vf0QsrFOsBNuaPXcapXdmFAGa8rmrmyRhpllUKosci3zEZ7dvnpbQE1jDYV9YhBjrKFSL6
	en75cmGZBvkNIo0ri3s3AxPjZo9kfe0em48dKLqnFO35HuWskt2wQMMyZLfVYcfmcUzr33Se3p9
	tu1o2vLTy0Nc2iH0RBdgfp7/xXaXdD4uSUCTi5GMjbYtHadQzMmEIrlT6cE/3Z1K7mi9hqdQbeR
	rrLN006K4JWmHHAZE=
X-Received: by 2002:a05:6871:a1e7:b0:49e:334f:312d with SMTP id 586e51a60fabf-4a90764b81amr1805240fac.16.1793377254766;
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 1/6] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 16:20:36 +0000
Message-Id: <20261030162041.2998170-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..86163a552 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}
-- 
2.34.1

