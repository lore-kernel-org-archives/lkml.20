Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260443;
	b=vI2tgdNZ2A807yyDHAbWuCCtd5PLlTswX7yG5fH6Glnb+zG3A1ERDBM4tKSOGHP9Kmtf
	 6b3JBgmWvjpUq+SFlTzJtyg/4ctaGUV9Y6juyZxG6pqalPSvoAF4uclHcHPeAgFD3L7sg
	 BoneI1TEHcKFLzfo2Ov9ThSHXSlfqBu1jMtr4wkkCA9POX3T4RTdEGSitNLNS2VvIhopQ
	 G9+KkRDuXUQc7Bt2pzlJLD61GcQq35SMfcH2bNDhnPS7VlnEAr34wT+uQyokv0tMwVyh6
	 AkuxSeaNSz68xw4oiuAWsCaTCovCdeWw9T1PsF5Nd4mCiT+YZn1AJrk+Kj8FuzEd9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260443;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uzNPW9Z1A5OMJEgLlGk/ev674kvO8zy8ZuPotkyvMA8=;
	b=BHmIueVmW37jt6FsJFkJ6WhroaRc+vpX2S1eiLZuYJNJXifdrHyQwYxrS467h0U80+w5
	 aGYdy9keqtUDT4n4aTfWVqaWcK37Z0HioBd15DXbBkmXGKsDauzIMfdH2Viv526R9AjbV
	 D/ZcztBGNxC91lXQizByQ6ZbDekaikqhTg1YN2XjiSJm1NArBjJjKTRp+CtjGg7wfEi2t
	 Hg7QE47fgKj0h4dvYZxwMUqALPk0B9TC8EsBoua0EcbtskZqWeSltyy3q6lUdhPW7twd0
	 Oo2NXBBE0/pZ/6t3AJzOS8sKrQa4GoK9vCG4JB6qprFx5LX7FEVbGoGR/YeHio8kDkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=BxTwrrB9;
	arc=none smtp.remote-ip=203.205.221.153
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4880606A33F;
	Thu, 29 Oct 2026 07:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4880606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=BxTwrrB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793260433; bh=uzNPW9Z1A5OMJEgLlGk/ev674kvO8zy8ZuPotkyvMA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BxTwrrB9g8/9sBfNrbRXqDcKxrMtT41fqwENdllmX3Jt1sSD1lTh/5sz8qcpCbAfP
	 LfTFZAW9EFlkdpRo8uJ4nIUQUjVPwwBv/hwwMjWBRgduwr9uAzAI1/xL5y1JrxuVEx
	 rbrHkhHxsdmvaBkGVoHDB4p0c2MWwU7yJdBEqUF4=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id D72B54D1; Thu, 29 Oct 2026 15:53:50 +0800
X-QQ-mid: xmsmtpt1793260430t668yju5m
Message-ID: <tencent_D8BA93484FB26CC87737CDE3FA8A814DE00A@qq.com>
X-QQ-XMAILINFO: MMvVzQSdFuTppOYJSOTANJnlYcIIuqSwAik6qc77uSYXBNxBn+cQDC22xPvHA0
	 6mwN9fAA0iA/MQv9LfptzLzuPZe9+ZXM21R8b6xlBmDRnvnGu+hrAX2kZrgNuxPo1h/Wq4ypvsxz
	 QtYrDbPa404AGgIBHZzme7qZyu81Vo6E8kM9z1bZ4pyeBotICQXWEM05JnM/S780wE4HGxwlg/Fj
	 gULymvHaCp+pxej43G3X2vX8z9PFJD6MJ7/bhaNBZIFzCx50m96RU20eTXAoTCAiD2iopv6QsPZ+
	 emGKD8eyKAhTHcIhbpH8TerZkEvZ3Gce6jBrS5bZcxuBN9eQf0r98J0ws3h5NNogBO6iNm1/b51D
	 frQceaHJrdRZTrSMDYY7a479F2nvcKBLv5S/CLJ2TSyiA78am/btU62phfY6Vrp787/7gfMILVEK
	 b4oBWu8JCLTkd+XSgGQ4pLVUKg3ts9T3aEFrXjdbfrw9rq40WjuFXTYtRM8IzQNn5VQdR1wTXfeU
	 AOf36qnBehLMhpW568sYAd5jj5NwlnThdO2DEtzS2y37Gj7Up4XhWn74hws4VcZHM65Ifrmm9MbB
	 8mG2HfNZODjOjA9Dg5id3W36cfPiMpFbBXCHGlE3fJc3LIpUvrov+X02cGXE0EXxxfQ2M8CJVgrZ
	 TirV+OWGCjX/elxXbGFjSt8uRmLoxnIKnNtm8nmJ1t3eP8RJuJKc38t2gKKWpQGioocrcrCg2FNt
	 6xEJHLPIEMQTJba21+nOUDfD1Qhv7f67IQQbwl0XP6a2is/QxiRBKc6yfmQmuE53G1WEiJhDfu4S
	 vSF36DL8gkeo/HCGfWaAvLPMlFOuIexcpopjaF/V9NhwH7kS1CgqJyDlsF/ISirXh3L2Aq42P047
	 9Uqebvx781xiS9KthQI2Z2odFVhm3s0a/LzwrdMeGe0SDhWXbeE7HEpDS7mvXZbBOYJMsfh+a53i
	 yBMGhXsv5UBJpac0jo7lukuD9SXL0Z7NvFUfbHdoNS/2Gi8x7qirlBCQpYfmvW88rOZczv2Dv86V
	 FMF+a2SqL0R7ZywjmdO6sPZ/03ar3wDC6IgCqUnh5KFtp14NeQYzR/c4iHSvA=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Shuai Liu <847807867@qq.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: camss: csiphy: add CSIPHY 2.4.0 lane settings for SM8750
Date: Thu, 29 Oct 2026 15:53:50 +0800
X-OQ-MSGID: <20261029075350.2906476-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028034105.326535-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn> <20261028034105.326535-3-xiaqinghuan@mail.ustc.edu.cn>
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
Content-Transfer-Encoding: 8bit

Hi Qianhui,

Reviewing the series (built for x86_64 with COMPILE_TEST, checkpatch
clean, no functional testing - no hardware here).

> The register map is the one the CSIPHY 2.4.0 vendor driver uses for its
> two-phase variant (csiphy_2ph_v2_4_0_reg, 103 entries): address, mask
> and parameter type are identical for all 103 entries, and the data byte
> is identical for 99.  The four remaining entries are the SKEW_CAL data
> bytes of the four lanes (0x005c and its per-lane copies), which are
> 0x00 here, i.e. the vendor value.

The commit message and the table contradict each other.  The four
SKEW_CAL entries added by this patch program 0x54:

  {0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
  {0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
  {0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
  {0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},

while the commit message states twice that the 0x005c data byte is
"0x00 here, i.e. the vendor value" and that "the vendor value is kept".

As posted the correction does exist, but it is buried in patch 4/9,
which flips exactly these four entries back to 0x00 - so the final tree
matches the prose, but patch 2 as applied does not, and readers of
patch 2 alone cannot tell which value is intended.

Please make patch 2 self-consistent: if the vendor value (0x00) is what
ships, program it directly here; if 0x54 is intended, fix the commit
message instead.  Either way the csiphy hunk in patch 4/9 should go
away (see my reply there).

Thanks,
Shuai Liu

(This review was prepared with the assistance of an AI coding tool;
all findings were verified against the patched source.)

