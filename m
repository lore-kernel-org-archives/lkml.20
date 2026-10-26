Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006029;
	b=xOgKAriAUAVXtk+flrrQ5uQiZqqajbT1Lx3j93DNciYizRnKMmneGuFYFrrjWgegEf8I
	 Ua6FVrqUepjoCr5LIRz58Wcdb86Ogc+hRiT/Y0eMGn4Rh4uimvws8CTEtmZCHgJS3diw7
	 byDjLwcoAhsqJagSBw/tBUTTpuR08Stgl4DTwZBez94/K9Lh6Wu8S7rqFpuPtB0avXmEQ
	 jiuW7pHDuqst4DoaCC/XCqI7Luus4kpP6wgnyMcenOp7yIpgmi6JZIeri5qk8u3eYIaoZ
	 Wu1LrQTU8kv0BgH6AcCeQD9zq4aSkkQ1oXzIQVupp2VmaZA9/OVoYaXRvZwu83wKMkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006029;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=43pDqq6vFSrPujroVpHFrIOYtAlfbhzMNFlambJDvYU=;
	b=pKEYMCPqaRy32zXd8J2V6sfeqN+OPTPP8lt98KK+DRKPiui4nHtqzXC2bO8VM0DL5UF1
	 dngdYU9/2cmRc49MZw0UTYbjcJl1UmYJfo64ERqWTz1OrLmzBJMLpWBn1bPV+lLl5kOuG
	 PYfM3tEklPkbtFeq6mO39raxVi9wLI6TQYMWs9AQBe8DY6q41NHWmZBeqaRIdCfq7hDOn
	 LegnMs5diz1qLDBsIiK0kZoQu/+6ln1LPzZ2+sBvwcrGtML20F/5qzuzc17LCuha3ZDXu
	 r5usXhDBQfb0oO53JNErXEl7GKvUnCEyZc3fz2VSp1PznIlXt68Oal5pVNAU42E3N/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=k0vbnGt6;
	arc=none smtp.remote-ip=185.70.43.20
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E657D606A31A;
	Mon, 26 Oct 2026 09:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E657D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=k0vbnGt6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793006026; x=1793265226;
	bh=43pDqq6vFSrPujroVpHFrIOYtAlfbhzMNFlambJDvYU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k0vbnGt6SA00S/ZTZ2pTxa3t+Yd0kPoKH7Q43Ik1CU6iahsNUQXItsKWSvR9ZvoDt
	 8Qpj2n/ksnKgTQHhsSCpEAByYhguGrrLQ3RxbOKH/R3iPIblWF54u5CfQCFR7EC5yx
	 2l2kIzln1giHMYm7CYP0au3BXnZOMeUkoLjrg6fnWVUqfJgrEH/Ku+WAUiGupse2cz
	 N/aXiGAUsW4/wBNnifdGzddEOeCiLAFgXMii9Ipc3ePqY2OZFkmZyPWaYSYkIp9M1+
	 YQl3cTGTMN5iZDiKNbMtgiqFsH5pPonU6NhFVF5/5jkZf+CTvCV4mL3Rj/1IR6DAX3
	 Ps3X+i9AubbrQ==
Date: Mon, 26 Oct 2026 09:13:40 +0000
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Message-ID: <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
In-Reply-To: <20261024094027.3095475-5-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-5-atanas.filipov@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 2a8ea65834f7989086f16bec1556eeae0430390c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24/10/2026 10:40, Atanas Filipov wrote:
> Clocks of different VFEs can be fed by one clock source, and each VFE
> sets such a source to the rate it needs. A VFE started later at a lower
> rate then lowers the source under a VFE that is still running.
>=20
> For example, on SM8250 the two VFE Lite share one core clock source,
> which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
> 0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
> on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
> Lite 0.
>=20
> Group the VFE clocks with rate tables by their clock source at probe
> time. A source shared by several VFEs follows the highest rate requested
> by its running VFEs and drops to the highest remaining one when a VFE is
> powered off; with no VFE left it keeps its rate, as it may feed
> consumers outside CAMSS. A source used by a single VFE is dropped to its
> lowest rate on power off. Clocks whose rate the VFE does not set are
> left untouched.
>=20
> In the example above the shared source stays at 480 MHz until VFE Lite
> 0 stops, and then drops to the 400 MHz still requested by VFE Lite 1.
>=20
> Grouping is enabled through the vfe_clock_domains resource flag, so far
> only on SM8250. The current parent of an RCG depends on its last rate,
> so other SoCs keep setting their VFE clocks directly.
>=20
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
I think this patch can be dropped.

clk_set_rate_range() is a CCF provided aggregator which will allow a VFE=20
or another consumer of the same clock to set an effective floor -=20
without having a driver-specific voting framework.

/* vfe_get() */
ret =3D clk_set_rate_range(clock->clk, rate, ULONG_MAX);

/* vfe_put() */
clk_set_rate_range(clock->clk, 0, ULONG_MAX);

This should subtract:

- camss_clock_domain
- camss_clock_vote
- camss_init_clock_domains()
- Associated boiler-plate code, mutexes etc

This holds for camnoc_axi and vfe_lite clocks.

On release, relax the range first and then clk_set_rate() to the lowest
listed rate explicitly.

Bundle that into patch #6, a driver-specific clock aggregation mechanism=20
isn't required.

---
bod

