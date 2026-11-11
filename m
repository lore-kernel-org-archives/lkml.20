Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384395;
	b=Og09AZok2nR6oL9r11kdrP9e7e1kuai7M//YGC0zxMGH/gfr6SXHrTWc2DPpJoW6wiMz
	 gx00R8bkBIIsIPW7eRCj9UuUGb/0sBk+YlUhybwlN3s/930bfT0l/WyIqwPlZHH9dgMRV
	 wO/JGCYG72r4+NLSJ9tPQSm+reZkAYsEiYTust5Ti5evL6iwMLWxDuuiDo2KaX1p0Skcp
	 Mp8EtuDg18bn4tycwxfYbFmxo3Iz0odRCBXJRNEK555Xs+si3oSWsl1qKAwOAveqxA+Mc
	 p/GDBON0fBnS2LojrT0dKAQvkPc6JoCOhANCfKnV+P3h1YrgijCqoN8PCn+bt8F+HPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
	b=pM2MoSc6wlIMkT7Mia+TMLgseEflLQFYpEhi3ZTV4JbYB2nOIrwFZ5DzsNBd/NTSxnQv
	 nQAusoPfBd1hXq/w2UKYtjEu4LL6K8J7Mz8cagAkQeh48Na5DW52Hf1vnG7w4+djEC73A
	 Ti2ksf+72fBKaAsu4EjRD1yoFgGiQ8WFc9/Vrynk1OKgfhr22eFv4oM7lGaor17qxQovp
	 FQ46wUmDs+mzOTttnqafzGPvIqGiFJ4e2jUUBKOqpT6WJMW/w2omo5flTmQus4kJwDFRo
	 wmjOpitovYRf3Pam3QxsSMDLkenxTtWat1k4a5HBpMjSZeq5F5AwKmei5IfPadda37A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nk8QewPw;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD8060A5BC2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD8060A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Nk8QewPw
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505186727fso208781466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384393; x=1794989193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=Nk8QewPwJwIWwCBkJQkwqLqUH0F4hfEadYxImwylvX9zqSPh44IE7kbONs4f4Fpp5m
         JI/W38VEG4J65NyhxM5i6PbvVHFzMJOb3NanD56JoJvDNBcnMWqddIRaiH+FHyB1PVtL
         0F0AmnCpTaBuiMs3x2bDROMmqpc/MYRUaWKyZxPjYS7OJ1rQrqPlZ1EMxfwcqbbTfhKH
         D9j/SwJU5UqJ47fWKWJofTmjLd7LIbkszXYv0YH7+fMaMWF1Pi474yOonq1R4YYvV2Nz
         IaGhyl78AF/CcPTJd+q9rasm4R7lHQ5qS9CwTqNYY+udRdL0WB4A0Teg+gyI71vg3GqE
         V2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384393; x=1794989193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY1xGf6xjx6c8K79NC9uGzboL+TnbiEN+yACYOIgnmc=;
        b=LzRzgPq77ezENZx3030eSg93ibQ+awxR5Iupy58B9YETeE16WUyjsJ9/wPZI6JWlVl
         +Y644ZvWz4FKHf0OIltvXqQAZwI/G0JfdM2yOGp3jGqW5ygwr3m+bJoFTGa99cy+jA6k
         utHFRn2gZ1MtwlaEz52F1mfgtkloHGyM18OciUonxAZendJhYLZoKK8Lrs++hoEj3BUB
         /P3j+IfZAML/DZiQvtwLu3eBfIpn30tGPBD66TS9EDi+UN6d/UfuKhhbQ7mwBnkrf+on
         bVFfa+3WDrx0QnL6N90kN8yenOySs7EYcOx+zXkSCMv0U5BpxWFmbNSRIZlDlanOHdof
         mhMA==
X-Forwarded-Encrypted: i=1; AL+hErGTxupgHR92i1HoIXdHT0mlAJhYtg5d25dHaU6dnfZjbUAhtDYClDYqtQynEvttAFSfOLGyr5uJV/F3QtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/My/1bEeQKO71eo7O15NXcupW5nyS7U6wN84Vde9yCWAiQftJZ
	y9+2+VbE35jSKf+Yb/dcOklIfDHqnSKtOMSQToI6fFyN6vQ1RjLhZRn8oDrhRdmjDQ==
X-Gm-Gg: AYBFou397J2/LXYg2Z/HuVSjh3WUl2DgJOqMtl1A5hcBcnXwPJMYw0ttJAFNXa9aeY3
	9yhuchQQ6RnTyiKbOKAL6Pjh0y/BCwTGG0kPeP79L/VPKO4NqsY8OEREca+BFfPsEJKc66vQEYC
	0WWoPFBSu6yt/BeApV3wll+lQBOP6LI5NVkgT8X4l0HeQshDg225UQtwRyyY+vjDB7J0ucTKRJA
	3d+artLHoayj0RwfezpCweovLjVKTwy5uDygm6wOH1oeLTNdPOd4DqvsmBbnSWb7WJclT4FlR5N
	zisjDJ9fBotNj+Ttl7AEJ2MhI2m6d0J9/eH+mo7dO6GH+Z4XpXpoXaBGWpON/xm2u5956otqhG5
	xLIS9fW48e+3M/DqYNz5IwG27DkqnsR182gmMDvnwir11w84seUIjThW0JaOzVIuAi5k4z8U4DP
	ZOfuIme00vQcTlZI9ubb1Q8SNPPA0HqqVYd+ZcC1LrxVtNGoAmW3sXTVQtrDyUSVYEEjGYu4DGY
	OBOYnhcLigbjx3Yo05AaZxhpvgnYfmEcu7azuXsK1rRk4INX0X6jQiQm1Brw1O/HjpCQfrr6IPd
	9kscnwVKVP6ZU4o+9kxHdWZs04Lsjm0K2FRdaDklBPvru/9tidOnIP0z23/pdc3gLk5dm4MHaIp
	EECnWndVpLJQkMsaAmksJjEKS5sqD7fZvukE+Mk/LqhXF+G/J+f/dq7MsuwC2hEeuBJci1/rGnZ
	MDZcOd9I1+mVIap1A4QlbaZd/nDjun8k+Eog1i9lfBiy2+RvkyMZo6BxPG50+NuUeeBwNBE1t1X
	pE6z5BrD1nwGpsqR1LQOk1PLnz2MMx2U6HHqEtT0zs4gqX+0c/9PkbL/SHqRXcPoa5Mpg4DSG4E
	grDEeyuet/d5pqGiN/A=
X-Received: by 2002:a17:906:f59c:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c50668b84bemr120721666b.4.1794384393506;
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] soc: qcom: qmi, ath11k, ath12k: take WLFW messages only from the firmware
Date: Wed, 11 Nov 2026 09:06:27 +0100
Message-ID: <20261111080630.244427-1-julius@bairaktaris.de>
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

Any local process can open an AF_QIPCRTR socket, send datagrams to the
port of a kernel QMI client and publish a server through the QRTR name
service. The QMI helpers hand responses and indications to a client's
handlers whatever their sender, and ath11k and ath12k connect to any
WLFW server that a lookup reports, including one on the local node.
Both paths reach the REQUEST_MEM indication handlers, which free the DMA
memory that the running firmware writes into.

Patch 1 makes the QMI helpers take responses and indications only from
the servers a client looked up. Patches 2 and 3 make ath11k and ath12k
ignore WLFW servers on the local node, as the firmware serves WLFW from
its own node. Patch 1 does not depend on 2 and 3, which can go through
the ath tree.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (3):
  soc: qcom: qmi: Take responses and indications only from looked-up
    servers
  wifi: ath11k: ignore WLFW servers on the local node
  wifi: ath12k: ignore WLFW servers on the local node

 drivers/net/wireless/ath/ath11k/qmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/qmi.c |  4 ++++
 drivers/soc/qcom/qmi_interface.c      | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)


base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.53.0

