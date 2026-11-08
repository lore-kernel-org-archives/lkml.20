Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172602;
	b=EtZDgTfx+Ad9XVTuLwyEQFBX3y3ykiodrbkS/Ydr4JjQBoewmg1CjJzahDHy55TuYjCG
	 cLaWYTLqiGfKk3Y65ZDka9hY56Z4TtOaD+6I8Xf0/3/QUH5GUJ2SQMKaOnMK6hHlHOAu+
	 kpctod01snR3SsiRF9tJgvAyWZPdynY7ZPCtWh1o4ST0hB7k4cqk63YnrvevcBUS+yUDz
	 D8lzcIATaDD7r421qkdJ76PcYHfl0kNo899cpXMRqkMsZyNrPI69TkmCqaiqfcVDgqQtw
	 jx43dEMNNOY8XgVW5kpLq+g7/Fnf8sB0bR/5VF99qosvqeeQo2MjlZaSydaYWaDFM+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
	b=rmTWhQYKY2OVKT6xXhGyfCY9nH6u4dzTxI84prsK2j9bobRX8y4GIfkBuCobWodf5z2E
	 Lu+VrQPqZM5K1NO0EpAc7dTRzZ9pk0u8dFa6OcWS/i+mBrAHo1C7GMupm0tX/HNbV8B1Q
	 lJbk2XOx6U0I+7UEL4xwViMDYNhG4ds1rsDMBH5gIEjvjWngSUi9xcJBDq421XJSSFEU1
	 Ir+affPmcmGD0I+r28Ik9mVvS5bhEs+LTIKEiI3gSaTsXf62ZHampDEljsJdjpjeOZW/6
	 S0cqLXJKfh46TVQC6QBhAFh+QBW4UkU/lF8Man0z+vO7Jlo0gafjFutqJjW/yOhb0Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8AWoA0O;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6DB606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE6DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8AWoA0O
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-702dedeb70dso128632eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172601; x=1794777401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
        b=h8AWoA0OWxbqjyWSNiYXEzTizNbayTb0xZvvXcqCgkbk2w6HrwjoDDPGXFLH/fsHDO
         BDyEC1UwljkkYsQwQnpdWzQFEYIVN99b+HFiVsQrgGCKlGMGz9PcaP57xeV17t6Nz/S/
         gHkBA4kiJt3gn1lxJxuScSF382vlSUtXxg9JA1pmbjpkCc9oovDuzn1bws859QUX2aek
         w7pIy4d9VWt4Iaey/v74OrK9GqNo+Hz5qSlJ7kVutNNBYDHUjGLjz+Mc6L/qdDMDKG01
         AS8nZFrBadASG1JTaDpel7dwavlnGnsHdS3p7XxN3CGMpp71D9eDK9fDgFncwCT6XS2e
         CHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172601; x=1794777401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
        b=ChpIVPux2pjQLVy32P3QqhMFp8/Y3uaxsZKZZ0EKS+dna7XofP/cA4hw1R+/Cal98G
         ACUA88t+TxLsvGEbwZFxr1zO33vInHlHVKq3UMdlKB9lCZ5hEgVG7BwvWyrxzaWt95iV
         jmq1gf0w7kT6l2lQSv0ptU8e5wSjS54xylhzd/5Txt0v7PmhlNDIdfmbrdlq207CXH2S
         nGyBjTcfyaifj7bfIMZlnpkJifEFqHjIDeKvAmojsn8bvT0gzD/M22k/XWqgUIQPuf9i
         O7U4sneyHHEU8WkEegDrArZjUKOuGXj4Tg5ypPGrteBAoJ2tftulyEeitWjNDDGK3CMj
         oeXA==
X-Forwarded-Encrypted: i=1; AL+hErErhm5Ql+T0SnaMbXWQi1nsAlsL1LPE4rdgetPKDotFF7ycQ9tYbDTvj6LGSVrjIZ2vYIFGGqLauYKLXG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s0rN8svCp7BN27wWuDw1spdk/o5fcI0Xp4JAG1k0JMN7wLO01
	VAkXvrLoFwZsl7ZIej9At8CIWAExK8s9goYzfyoiq4bAal3s0j0duXbh
X-Gm-Gg: AYBFou3cgxMfm8bV1loZja8Vy+8HZ6KX397Wb3qMuoNjeyuuKr3bPJg/AqG7y5NVW9S
	i5SAWxWM/L8kSz8Am3ePG70/tde5IHxi7gtqJ4lsQP328IFup/ycQTJktYeawK554B/09wXf3nF
	sw03GyxCNUIelNt2zR7PXU5hR+B3vixqeNWd6lmsWRw2qKKtCHh58Pd5dJdgSmYeew15stE1dlk
	VerDoMTyphBpXl1CegmRbPgHcMk8vwSCF4c/FQrlq+yeLO7Ekgpl9qT4Addrr8JfC4UVKcH2b+U
	pBMm/fsohB1QN6C6TsqO0HJZE2TAZJLGrS+GIOYDFceGPteAeVAbuMio+B+i6L8Ve8+J4cXrIaE
	2ObEaC7zI8tOXslHgdrnJEArPKs/9LeH0qkHSA7DiFJe8SzbNfhFK2eAholHGJobDTRXzYf0Lse
	vKMmmErwdgfnn5P32VbcZ4dPZPnlOlhCtUSA4wt3IRFlPEECVgP9e4mnoWgxaZD16zwUV1UaBnz
	7OFcq5ON6bZGg+l4RS6L+LgU3KfXasL9UVH51WchYFXMoFOarjEfHG4EKG/6k6h2I1Uo0FNgZd5
	b15ka/SBIFT7QQLI9Vg+qxJzKNP8rL4TQc1MmSUWiYjPxTdDspyVZWvo3e2uLJ6Hf3tjDQFfQAU
	IFmVMSTAYBfW2cnEEn9hJGLSzMwPz0u5jzbz7oenr9hX1wkWdW1rDOV962E8NUAioe0GJQm3W4C
	21bc3Z9FYrS6KBkHACczNDkXu6QalMGPtPSRKge/INV/ArSWj3O5o=
X-Received: by 2002:a05:6820:1381:b0:70a:df8e:8f64 with SMTP id 006d021491bc7-7170f259c8bmr1073868eaf.22.1794172600816;
        Sun, 08 Nov 2026 13:16:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: qcom: unwind failed child initialization
Date: Sun, 08 Nov 2026 14:16:34 -0700
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbaBzSCJt2I82E+RGtmwm4SEc
 O9uevh+aZ7ukEiYElybHYRWThxDCXVqwE0mPAjZlwbd6YtS3YDpY2fO+HZxxmCCRzfxy+Mi0RK
 SSJSEq8KxJz10Z6MG00PBFqGRt9+j2/3fRXqSy1WvF9YkQismuKlOc/Zt9dtAW4bj+AKcTNgMq
 gAAAA==
X-Change-ID: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Keep the shared BAM transaction usable when resizing it fails, validate
the boot-partition layout before publishing a chip, and propagate child
probe failures after unregistering any previously published chips.

The layout and allocation fixes make cleanup safe before the final patch
adds the missing controller-wide probe unwind.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (3):
      mtd: rawnand: qcom: parse boot partitions before registering MTD
      mtd: rawnand: qcom: retain the BAM transaction if replacement fails
      mtd: rawnand: qcom: unwind registered chips on child probe failure

 drivers/mtd/nand/raw/qcom_nandc.c | 56 ++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 24 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

