Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260460;
	b=ZFWC00hAUxOYgHVgGdSg6/tMQFLhmTZkD4Cl/kJLizo3tuKBAF9Lk4hajhr8YHWnRc0r
	 BNmA3gOpzi7eFMZEt2h0NmdwtZa89cS6Y5klvmelAHLynvouQrR4gNKXlUUw5REdQPR/0
	 zmXqDGBE9hVQnNQhNu6xI2j+W0AHQizWII1eLPK3zmcWUVWt8kVS/J+fG1AOMK/Vxs3rL
	 fpr4OX0OkN/0Oxmos6biA64QbCXuiFz9eL33jHVVdYm2jz8Tnp8jcQodAoip+ezHvhSYL
	 an3ATQXmEkAD4UcbLRtaXRRKHodF9xQhQ25FaCIJmvwefROYHiL6A+f3qc9Jhk1RyyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260460;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zarMwuSQY4X5KqyFYldbtD6By9egYAYuPFBFtzqZucg=;
	b=YNPBJLOCxzAu6ceSQRuzzsVbOPW5y4gcxLj2RnPIC/qei+L2BZEPsVBH1hwHWhwOiwiV
	 uHBSTqiQzgmJeoIsQvPpzUTojK9iZ9+aMsjKlN/eO6n7AenqVra9CF4bd0O2d3LlbEfe0
	 HoT2KmVxlkEimFBWSPyYi/hU7M8LWt82mZ5UW1JtTOUk5wEnUmYPczITSWiqPg3kEAGT2
	 76TON64+Rl40b/mE2ktNlHzMyrUM4vrWqTerlV/uQ8GiIsgG/x8PFvLwAVMMToDfgnEUq
	 57OvuFBXPzfI5XHS5EaShrgGvEpSoB0/jnrmULSg0n1i2oSO+TbqNcPJm7qWsSLpcrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gwRtz7S2;
	arc=none smtp.remote-ip=203.205.221.205
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F6560A6F50;
	Thu, 29 Oct 2026 07:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F6560A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gwRtz7S2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793260451; bh=zarMwuSQY4X5KqyFYldbtD6By9egYAYuPFBFtzqZucg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gwRtz7S2yWAzintgqkHs+NkdsAPTsZb3L5fgNaeFDpfHr5W8L57KNqk8Ldl8Uh5GJ
	 WcVu4dPw+WODBuMo2TkKxUZBLBsL6jNcJaZFtYrScqqCRkacCgZjT5YUNoRwo/tIcE
	 g8oNliDNKUmI5U6m9gunXs8rNkelUAUzow3Y8cHU=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id D879DC34; Thu, 29 Oct 2026 15:54:07 +0800
X-QQ-mid: xmsmtpt1793260447t1r6eh427
Message-ID: <tencent_448218F104903BBC74140B91BC5B93362E06@qq.com>
X-QQ-XMAILINFO: NZDLPLkmlc+zhVmsY/wjaXxHdQKTrxnCdbnghMeDGbidoY68qzMmo5Q0QIikMN
	 gOyOY590ZsRIb/AEHSDoHJNFnh7QdEsK3SVybAK7VRFmu1zAr6xb7CnwK+/73om6/OtH+gPQULGL
	 Epl0evOQeXm2csp+4g5YfEVPY4G0T9lC6jLz4Ww+eYvm9aPKGEy2hOwbZW/2ipC80oV3Ps3VHHEU
	 lhjf6610nUTEfwPszrLB4nr2thnKLDfz4WQC8VrixehUaJZ9s9weJx4uC8I5qFg83l5/TEEUMUh0
	 6aSZI1madTT8xAdF0pFndIzHWi7vXS8FxV/Hq2fNxfHRu0NlGBf2FviG9g/Rf1QSl/kFGIx1KEOw
	 4E2r4pzpxKczhtYKycTrElutmchn5vjAKe53o1E8q2qkpa3JzbakstJNLQNttoG1tP9hG8yKHhJv
	 2CDIsEYYvkPJgmEXFRCHMfe9ri8QXZ+Ut00SBjJ92cwpl8EI2dPY8JxG33eqQFQsvd3lHZi9u/5c
	 peZ7o1pABwqyD3CKPatRBv6kgn6Hg7GDa3EgcgQ3ZrLKcMNBfqMJbCVtHEspiND2ZghmFtYF2N+E
	 pLs/E1MYj3CmnpvKAtHevhjo8svXEROlt+pn2l/cNoJ7T/kVgFrBdUscBR1LpaHS3cnuQGDpWH3K
	 geVGk1bgu1qviU1sJcTl+26g/vzzv80A09ni5VNTMKvJUl8eYiujshlOv1MeDFoFKmq0FRmSA7Gg
	 3ioPKnCc/PLA2FZE3nvfinhALuvtQp7zjSm5EBRpCFt86diLmaFRGxaZizDAT0s3zlzLuLl01Zk/
	 hKxBCuJ9qnAGj6XrHZo7/GyKJ9FBnEDRoJ/MX0eREkbQmqwyup7p6qzoCBARwQbSgtR44S5mt1Pv
	 n7m+cYqhh6d5JZ4jmQ/8oytJPv5iknBRuJIbXsTtVUMFG/gLsHPunVvRX+hbBe/fB1UT1+MF4M7z
	 5Lgg5GJV6SOC9cXskFs0i2SdP0erfzlS9qnrLR2vsKDBbTWqkVH6+aCpgIskGH66FO/vWRqvs5wj
	 dXNeZTfGpf7BJElm7thOhVaX9xr+PGnuAdSKc0FaZSi0zwtBB36gb0ewQDwEugJ1yhIefb69cF9a
	 89eOMadzSNxsuyjiU1jY04bnyfUQrPjfZLTLE6
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8750: add the camera subsystem
Date: Thu, 29 Oct 2026 15:54:07 +0800
X-OQ-MSGID: <20261029075407.2907313-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028034105.326535-10-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn> <20261028034105.326535-10-xiaqinghuan@mail.ustc.edu.cn>
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

The node itself matches the binding from patch 1: 19 register ranges,
35 clocks, 16 interrupts, four interconnects and four power domains all
line up with qcom,sm8750-camss.yaml, so from a schema point of view
this looks right.

One nit in the commit message:

> the SM8750 block has four CSID, six CSIPHY, three VFE and
> two VFE lite instances

The node describes five CSIDs (csid0, csid1, csid2, csid_lite0,
csid_lite1), not four - three full plus two lite.  The VFE counts
(three full, two lite) are correct.  Patch 1/9 and 8/9 carry the same
miscount in their commit messages.

Minor: the node declares the camera subsystem as "isp@ad27000".  The
existing qcom camss nodes use "camss@" or "isp@" inconsistently, so
this is fine, just noting it for the record since the binding example
matches.

Thanks,
Shuai Liu

(This review was prepared with the assistance of an AI coding tool;
all findings were verified against the patched source.)

