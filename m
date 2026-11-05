Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905975;
	b=GyZVNAfnQMg2Y+Z84uJ0Raj0NkgsqjczjSBD3NzwC504DlTFVeLid46sZgcVJvx0PCpZ
	 GeDOY6VBtISWP+Dy7YeCMw3hid/3ZfFTn+Dvpw+iTwdVSFqUoBjAAMT6gM3q+88o84IhW
	 ljVGAxJK3Dx9w09YXegvP2hqAmVcOztBofRgR+/XluPzbxHPpnpysgKB8tW959Chi5Ejc
	 JeUVqXDQt5WodEyqAH1Efd396pHRYJ2ujiguAxQVC+EY0ODaPqcYkB0yQowrsszvtcb6T
	 th/s2LDfWzQ/p9KB9vRMLSEWzGv/NL5GFuEibpHrJI8QRb9XPq4jiy1cyZSySKYvHAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=;
	b=n5Rr2TP/i3eTIx1kvzKKt6GKLHdYlE6cI3DJ4CKWcLzqXOC28nw/evrZIhg23nWccGJt
	 N062SGJUayzuqWMHVWZJIwa7ygHFFffKyc/zATAYDM72/1dmGi42E2hHwShcEcHPdc8mS
	 hER4MwnBCuqFDfsuySZJu5lbfSf5BRhgecYtaj/JRM5IecQKfQmBpArUHiI1qwfR4D7NA
	 V+GitzrG9qeMFhCUOfMmkpjMSfeJSBlFPY2fOLwr7kUxNuG2OGJe/o92l7Wj5OaNaDYSN
	 f+y6tPECwfaP4vbWFtZctM5YDVApm13PHYTutOkA26SEbf+GWp05l6Zwy7kDNKYZqcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTFS6EhJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAviCzlx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAFB606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAFB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTFS6EhJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAviCzlx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeQqB1122105
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=; b=LTFS6EhJ9WZlv/J/
	1Er/jeH2zi7+21FYJcFpQXbEM5AYbGgVJsacUbV2u5dBmhZ2HZFmG6Xwk2raLyRC
	AonFVdNlLfY9ctnRw/YTKAJt3BdRll3iAde6TC71BPwwtBd041LiSzGxx+jcfANK
	GeQU5L2S098AfuaCKAsEst7Mnadp5WtGu+YZppJzCr3nShQdsIrfZDtId2G/pA1j
	+gAvA1QLM2LbUAXXbf1oolOrBQmwVNs0D0riGKfr4BsJFbsv1+KkPWIXiN0J5De5
	UkJ8FUE6Lvc5IZFgBu9gPaKCfB6QrBqdlL2jP1LKVE40Fgyk3or7sC7n916pNckS
	n/mK9Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p2md5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:12:53 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so3396579c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793905973; x=1794510773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=;
        b=eAviCzlxBAEt/RtGxGISp20QkZvjKbupA+aOd7rWcPcaaaRaHjPyujG3mn2/rNfHf0
         XlHCdwwS63exgoAsRxdJyD+c2kvKxCIe3558FcqqJdXdS8shGzW60YX5JizE7k41Aedg
         MPKOcI9kmW+QflFjc7rH1XSfCu23vhY1t8pBtx1n+i/lU8/iZkBVMQHBjgXS4fLxC7nZ
         00SH1Lb7KvEEkpyE1PWU0c38nAefqbTuRLtXkXw3QJP0AvqlyJz/sU2XKEvKgVajtQWc
         VC6UfmUV8fkXAkHBvt+mXU9uGI5D/fcKLjOOdz1LzBhYf1LLPq8jrCCr0cwZjZ5cnsel
         n0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793905973; x=1794510773;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0mMRhns++zcKGrTP9aBFlkK9JTY4c9NYzIr6VNARtg=;
        b=XbpRwUnujccy59RtNrXCh+Ig4JBxPEwFTN4h0mEluBFWqNvO2fooQ2FSGwXSRPzEmT
         XI02dVGmp8U5uZvBozbIJqivcDb+FdsUqphSYMoTlsSBuT1hzfo9UQDnV4gFarhNjicu
         FmRp1OOMU+yzRmKHV/Bd24nHzYR+DP1llMAz+02YKLJ02QS7bMXsbGQwaUHHy/dD0wzw
         rCAQgaW/I2Un9DiNTeWX/vpN2DcGob5CJl80HP+Gh8y8iWbzI33GljcgM5Mk8yX3vtLN
         lbwh72aBWs7uVB/bAkzLnknL4BdS+nGv2Ey4o0runmIRGFNbQhNSU2hoErXjCdHAH6km
         7A3A==
X-Forwarded-Encrypted: i=1; AKwUvBy4tt3m1vWeIzaHlGT4dpbe0qNb/w80QYpb7FW5/na4LPhcBlsmkaoftlS20Yci86tnS1Hi//W7MKkERoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tJqk9dB+tw6PDsAGB1nlt3oyZ4MPQ3DdehFtnIb/K4EzpgY/K
	li+QimGDkCtdvCE5mi7zHSf1pXjm3L5n3KOXCI1gVH/Fq05qAP5Y+zDz/wT937cgEuaIbHIJfgx
	TDsNVFD/PUuER/H9RDCoWkU7jZnasiLQQAwfyzLxk0cqnkE445G8aDle2mEAqW7PckJw=
X-Gm-Gg: AYBFou0Cccm7asOt6Ymf0Sc1wncz/H9Qd5DvMHBlja4Wvws49SmJOlA9Z2CvKw49/m6
	YqIwfBuzepjGS4uBXoLvNSQFFQX7HzHEQBPE/EaoohcrJ33g+Ep6OT3SgJZpaVZUHX2zsaKzar8
	veb7gXWP/SwjKGt0JrvSAjoVUnb6Tcm4MTRfiEy8cy3g9RVotmf7chJ4koC5y0jwz8oYlrKt4D2
	5mBhIqn71KLLr0/y6CCs3l7dyAfpFakcET/4NBjmrmbuCnR7WAsTHrsA9KqhUtKMrv2TwsQMCDo
	fECXSxlePV8aY60//qmewC+BGN1VD6tjYXXnkIP+6TmFrKo16WQV2FEQIBDR2D/Vwv4fPaVRLEs
	3WkSC2f8mXgwvXtZBN8Sv1Jy62xwMNausCEAQpA0Fax1CrM4OI2ddZpE/hT6FCrZwlS/XCHdwYV
	/T6YydobL2hNMStD0Ri6IwvsLKTA==
X-Received: by 2002:a05:701b:455a:10b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b242e3e78bmr11296100c88.12.1793905972649;
        Thu, 05 Nov 2026 11:12:52 -0800 (PST)
X-Received: by 2002:a05:701b:455a:10b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b242e3e78bmr11296056c88.12.1793905971882;
        Thu, 05 Nov 2026 11:12:51 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm17728365c88.23.2026.11.05.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:12:51 -0800 (PST)
Date: Thu, 5 Nov 2026 11:12:47 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>,
        Linus Walleij
 <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 00/14] I2C - detailed transfer reporting in case
 of a fault
Message-ID: <20261105111247.000074c4@oss.qualcomm.com>
In-Reply-To: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aecd536 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=JvO64EORAAAA:8 a=8BD2oR26EWfAhSrP7b4A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Qz6KxWHdQ2_aS5WpiCfK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfXzD5wd42X+jpr
 23hyyPDnyYWX4BC58ewANL3ZDwI0aNRiLwIFF12//aD3Yu1N7/sPcj1JDoVbIHvcq7ST/cIZGKP
 egBPhQWPiZIyVqP1dMnmcYjXKUh28Rubp3E7OIiH50TIB7PuY0ggeYzy3eZWvLQm0yIYPKxyzIe
 SSbgNSiG28lJEOHGVtt+ZXiMa+X3mKiqfHfjQS/Sm+wr2idVbpthINwr7IbQlijvyv7dGmsD/b+
 /BuHGJxUNeC5gEa/TW7D0mnkNy7sN+tcYwT9gIQh+iEStHLbycclgAW78IRihJQKeGR86EOR565
 IguVuNozGb1sp1XdlNgu/FHjl5Ox+n1pL9CXskcBYFawE8ceoBT7gegdqLzwMAVLkSJqx64BovN
 F6Pt5eA1vPcxoMcZ6JVyZoCnlnab+zXXTwGaJbA3hBG/D18v+M793BwzZpFoVFDoecnwJuxUwfn
 77C0IbHo+XII/GEWuHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfXytHNskgl8sjo
 dQQMV2zj/cG0jl0wVQQIHA6ulE8ODH7G7qqHOBV3NH5FT61wES/qeqF7q9HNMg5b/pg+ag2Wuxr
 iId0hdnxKd8aQttwkYUDOUf4qnru+/I=
X-Proofpoint-ORIG-GUID: 4G2ktYEEM5taIh-k4L6U8dAPd8GJviKd
X-Proofpoint-GUID: 4G2ktYEEM5taIh-k4L6U8dAPd8GJviKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050076

On Thu, 05 Nov 2026 19:15:21 +0200
Dmitry Guzman <Dmitry.Guzman@mobileye.com> wrote:

> The existing API has function i2c_transfer() that transfers one or more
> messages, and it only returns a single error code if the transfer was
> failed. It doesn't allow to know how many of the messages were
> transferred successfully, neither how many bytes were transferred in the
> message that caused the fault, and also it drops all data received from
> target device before the fault. There is a comment about this in
> drivers/i2c/i2c-core-base.c: "REVISIT the fault reporting model here is
> weak".
> 
> This patch series introduces new API function i2c_transfer_v2() that does
> the same as i2c_transfer() but also returns detailed transfer report,
> including number of messages and bytes transferred before the fault. This
> also allows caller to get the bytes read from the target before the fault
> occurred.

Hi Dmitry,

Just for background, could you provide some more information on why this
information is useful?  For kernel side drivers it is remarkably rare to
find a real use case of partial transfer information and the
current i2c_transfer() return value approach complicates a lot of
drivers for very limited benefit.  Sure it is a small complication
to check for a low message count, but you do get a lot cases of it!

That leads to a mass of AI reports of bugs.  It would have been
much better for kernel side if it just returned an error code
on any short transfer. 

Given this is effectively going in the opposite direction I'd like to
know more.

Jonathan


> 
> For user space clients, new ioctl `I2C_RDWR_V2` is introduced.
> 
> Patch for `i2c-tools` user space utility that introduces support of this
> feature:
> 
> https://lore.kernel.org/linux-i2c/20260623-i2c_detailed_report-v1-1-b67259a31a9d@mobileye.com/
> 
> Below there are several usage examples with modified i2c-tools.
> 
> - Unsupported message (max length supported by I2C controller is 2047):
> 
>     # i2ctransfer -y 0 -r w1@0x19 0 r8000
>     Error: Operation not supported at message 1
>     0 out of 2 messages sent
>     #
> 
> - First two messages transferred successfully, the third one is sent to
>   non-existent target address and thus is not ACKed. The data read in the
> second message is available for the caller:
> 
>     # i2ctransfer -y 0 -r w1@0x19 0 r1 w1@0x1a 0
>     Error: No such device or address at message 2
>     2 out of 3 messages sent
>     0x32
>     #
> 
> - Target ACKs first two bytes but sends NACK on the third byte:
> 
>     # i2ctransfer -r -y 0 w4@0x09 0x80 0x80 0x55 0x55
>     Error: Input/output error at message 0
>     0 out of 1 messages sent
>     Message 0: 2 out of 4 bytes sent
>     #
> 
> - Message reading is not finished due to timeout. The data read before
>   timeout is available:
> 
>     # i2ctransfer -y 0 -r r100@0x19
>     Error: Connection timed out at message 0
>     0 out of 1 messages sent
>     Message 0: 16 out of 100 bytes sent
>     0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
>     #
> 
> - Driver does not support detailed fault reporting:
> 
>     # i2ctransfer -y 0 -r r1@0x19
>     Error: Sending messages failed: Operation not supported
>     #
