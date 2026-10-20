Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516257;
	b=iF1YRp3528VEx2jidDoJTMqlssj/RntwjhvJTqDZiloTK4ake5LVkK/53S234OQOO6uY
	 6eMKvSsTUNmC0z/uACSzVD7cPZCeYIKtJwAF3+AZt37YRCzmSZwMDi4te0f8CgYIEHqXL
	 X+ujyCcbZ9IUVXdELeoymZ/Qs5ih0m0Zx2LJqgBzbLMHPNjd7xhFyzXnAdBoDh1lnBZ2G
	 lLc1Px0kheh1yZ15HmicIUOvD+65xYYH2FF9Xe20CQKh+HVgC/hbxPgfiiTMcChZtBb8a
	 f10GMnlPzrHNgluWmNX6tsXGDZF6NGgSOanb+XqshrrIbwtakCMliFIZBjN8kEgA8bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=;
	b=n00NH5jpT5ULcBubpVZGOB3ADuJGCwi5EdWgqElbqRofaSgYyB8QTNnKvlAnuWfY40Kb
	 mYWAdJ7ktkSzPBTijCNSfc7EURA8wg4sF6Nutmz5/L2SjyM32cSU4ZOGNGKdqTnZaHb1X
	 vOBpi50ohS/m7fmh/0gA1fRo9w3h5QAfAAyRf1AuXyxSE4nsJiqpcd0mRLrF5C3osVWvb
	 6/juHIFP7RB3jv8S0xbNHSxCjxf3I29HfjvS86K/OsOYGhzYymTYWKxEK1BTiCi50+kqA
	 CuuajpHvP822xCjaoLfzYs9ZLqEKMOJSYnZIRlLR3gqx3A9GDwUCA0ujMrUIuDhTf0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cr8UEhZt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0sMa4Fr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969D606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D969D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cr8UEhZt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0sMa4Fr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtWke1375705
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=; b=cr8UEhZtHzcb3IqX
	cktx1/Tjz8ZOrSW7yg+EZjyDKalpeLFfVXvVcxfZ4GpdXdFGuKFaPVtumG8TBpri
	Xs+CjKAOSb+4yXKrNTEvUFfYF9t5qD5MbmfqqNGbF7psV0brw9s0rYH66Tr2Ii+I
	oAzpuwaR2C9LAdKXF4WIU8Xj45vbbt4KJOw0YjDlnlyKCU+hEHkOS05mR8edq5LH
	1T4Uqdy/B2K+cc3aeodyeQl+RvcjSR6jknYOZp+7eUQ0ijDlFgZ5CAj7yzfnZf4n
	I9vkWmzYQ2gVYynfg6gUE3FuU1mfMOkP9J62yHxw9T8pfBJTDHF5e+jrzE/VHrkV
	meRLog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd04u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:10:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so7540989eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792516255; x=1793121055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=;
        b=j0sMa4FrxjZPCe6cN1vCtvHJqdHWAXrR3xs1THV94u4mMgCWqC+2jP7f8l0DM9EUQ4
         n48QIqUKyWsW6x8DNNGZcwKErlvGXEMvdemAXAM5iy8tx+TqWOfH2DyUlcTYZK+F+yRx
         1oA4zjA1Iuq/FN/FHPKWdf/opjL9jDWmMtPbPhPTzfdLzcWOG2lnsdWKezIF1hv0dLZ8
         GZGBe7fWkz5ejm7UtzYX/NoXDiRU26vwvQ79uIq5KcZbpIcTAYxWjVDXs6HYK2yEfuht
         jgr02I2tZtN+SgueO4Mw+LQkQ87Par6cKcTOdruXOFXMCLcSYMBKCAFFZqK24o+Mcmq3
         0D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516255; x=1793121055;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuGp63Zu8Xhb/maxQXifefMXC5yHBwIeZ7UZd8sAo6g=;
        b=W4KJGfRgNe7T4hdYTGbxrgNSGBHvaT/v12fH4Bf8F8D8Ch6r2JQrIKBpCbg9gQ3usW
         M0CuGtbAcsx3z6s2WAcyNROtrWqtVsofTR35EUnlAyzXnR49MiAf366DDIn8KqkwHDff
         s2t4kdPXA0ADbA38ApBNBqiacrtX4m2M7fPBRwMKPQrF/g1uCsSTrhe0Dfs1PbXhk69G
         OYPzA+YwuibpiI3qWSNV7UJgUKdvnmPj5ZzQ6pMJWJhxL7gE1KRQPsnuAVkSj/xgklxA
         OUypUGpFAj57OAqOf8TwoHtB8V+D381U1sEw+X4OhfrO2ATYEh5o4AckRxi+8Op93JIb
         lStw==
X-Gm-Message-State: AFq9FYLGaTfxh/Z86CXIfx96b7lZ0d5Cw2N3od16DTjlqm7SZmJ4Fb2b
	9utjHUCUypF2Ou61XQeJyTtxsWcFUb539e9z3/fW4n8NbLA1DMmWvqpXhjuHgdxJQXHi7LJMoGP
	WBfZUC2KxXXre3ax9rSbD5W/0M6hAkxXWJPfPDyhJTpO5kr0eQtNBoRl4dFEgJtMPs04=
X-Gm-Gg: AYBFou2r63vEa+8ukwJFEbY58JeMl7JAyp6F6P86+Abe2a+NR/VVHUH0TL5P/3mze2G
	cFqVokMfY3EOnKjanrBXVQHqMvqXpVo0t8f1qeMhKQpvoh4IEzCrrKlpxKP90nn+e+5SoWNfWG6
	ltlcq0UtRJBcv0W3/33O7IFiTBiqZnoNc5+0yRpEQpBY8w9MMeqySUNRPUKh3jxmhENybA7lBiS
	FdWYmP0NN/9Uoe4FtfMLV9qD9XX4zx4LEczqipGA2e5btY7dXNmwVo4cZm5TG4Vxr+oghV5lKgr
	TIIM5Rp5RUthKVLvDWmOGnJ8kRrNNxhBr17fwMuL7r35+J+msM8MmiR1zshwdkylWB2zJhWZVVm
	EosCo1UTmsvNbZZDAeXThhuUXNTRdnABBaz/NEbik89k=
X-Received: by 2002:a05:701b:4587:b0:17d:961d:7db0 with SMTP id a92af1059eb24-18512e254fbmr15146310c88.28.1792516255307;
        Tue, 20 Oct 2026 10:10:55 -0700 (PDT)
X-Received: by 2002:a05:701b:4587:b0:17d:961d:7db0 with SMTP id a92af1059eb24-18512e254fbmr15146268c88.28.1792516254593;
        Tue, 20 Oct 2026 10:10:54 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm44388c88.3.2026.10.20.10.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:10:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:10:48 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov
 <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 0/6] CPER: Add Memory Error Section 2 support
Message-ID: <20261020101048.00000186@oss.qualcomm.com>
In-Reply-To: <20261019203915.2019037-1-pierre.gondois@arm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2OCBTYWx0ZWRfXzq97NPHcUMDT
 zPnEFSOTkB6dxWAXn3o5l/fhhJT+AB060mKDm76JQsGVBVMZj18LcyXSHGDHJptVIxB9Y6qp1Sv
 XA8ZlMYK6JTsc8X1PMGKcgn5AqUdu81W++Z9a9m8e8Tk0bE0ziaW23ZsQjc3S7gmQnzbrnZ+rPH
 bJ6EQwjhNz6vwxatCzoErLYV8X5PXsymnsRMIg8NXg0dqzV+xIp/P/T9VkqV2PPopwj97/V+l9t
 mIh7USO3qdlrJA9oMXgn7yM9u7UD1bqwWdaqWBwf2IUuy13ittuDAmogIxQd7Y7f5FrqyvHmzJ6
 JaBYiQabrZjY/yL6YlDRCcvDL6shcXc3mr0kHD3Xd5sbweUc7lqzJev+yYOugpwRrO9C84cw/wd
 X1MUOKYxgCamwK1bw13J+8jiV0SY5qXa7AdgxSM68J/YcvIEhoYTDDb+X/R0a7tr94Q/2Q3yJPn
 yvhXsS5DgcrZITYRPVw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7a0a0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=5VxSIjaA6f0WmzOPONwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: RvQECkAMi6Uu32cSfaZG9TyUrBbQ3-R6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2OCBTYWx0ZWRfX3xbYmtBuNokT
 ocMA4xIOF2mAIdOQGVtGLfVd3lCt/sYDnIqT9yOT+eejpaJylUhFCDN/22uY4OJBAhqQcA3jrYW
 yJZv1UtEtC8Xq+lejKa38tGw9y5j3pg=
X-Proofpoint-GUID: RvQECkAMi6Uu32cSfaZG9TyUrBbQ3-R6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200068

On Mon, 19 Oct 2026 22:38:39 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> The support is mostly duplicated from Memory Error Section handling.
> Other than differences coming from the content of  Memory Error
> Section 1 and 2, differences in the support are:
> 
> - v2 do not rely on a compact "struct cper_mem_err_compact" struct.
> This structure was used to support older versions of the Memory
> Error Section (1). This is not needed for the new structure.
> 
> - The compact version is also used by the tracing framework.
> To avoid relying and propagating a non-standard record format,
> through trace event (cf. extlog_mem event) the new trace event
> prints each field individually.
> 
> The last patch of the serie was only build-tested due to the
> absence of relevant hardware. apei_mce_report_mem_error() and
> arch_apei_report_mem_error() implementations were also removed since
> last version.
> 
> It will also require a proper handling from the rasdaemon. Applying
> this last patch without rasdaemon support will silent the reports of
> Memory Error Section 2 error, cf. ras_userspace_consumers() check.

Hi Pierre,

I'd slow down a bit.  We are mid merge window and convention is normally
one version a week or so anyway.  Better to gather up feedback from
a number of folk and spin only one revision to cover it all.

Jonathan
