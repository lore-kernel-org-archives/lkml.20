Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700056;
	b=C3pODB7+4mb98ib7HhsCaYY9QjPXfGiUJHt9NFdhAmH3+zAq4wvrAAoVL8EX7Q6QxKn4
	 zu57a6Oz32YSGBo/x49nNg2HqZxULWdWcC0pKYyHAN8Rq5uR4q01pnKAtXVbQkXgYLzAY
	 iLTDQ2a3N4aFDKi3HH74SynwjqozyLNclnYXnXDpnZ5WfVlU4LsckULB5uycNfjRkpffr
	 2dHaOuHxUV/+tJQvXMoWPYbDlzUeYkc4emyjgkmPYFbPHLwB0bYiWhVoY11r8vk2HfcKU
	 1qotOLg38Hf8IRvszCi+wANxJ8fIEgaHp7LVMGjuWqiu4pmb2JSIiifw28O4IdAQnlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wQcy+0FWumbRwDQmpOPEa8GjRMi/FKhF+FYVfjt++9E=;
	b=0bSleREvixClu3vNQZQy0UEDuBGBvkC6wC8/PaJzuUcEyqxbISFTCaV9AeWvfWzFizQF
	 x2qt5tHlU6BuT/fcM68aTAEWal9ZNcxz5vtvlDF55xwgk7FrqxtDMHzmCiFrn6uGtdrHD
	 tFdzu5zVxRPZuNXzgTh/xxum2MdO43zf7VnnmbwMgD2yxn25QTThCDY3oTg1+ev2Oyg29
	 hcvrEl8DcHE5fw8GekIUuoyCLJd1XEyhSbcv1pQzIBTJrpde/Zl6J5063L7r9h4e5FxC9
	 EQ40007cK/EKiEu+HfCyS07iF9jwRgx4eql6Utpnwq+X3MKJ9evtUyOQrZMY9J+sVZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJqxAzqx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bpQ0/fwQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C47606B355
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C47606B355
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJqxAzqx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bpQ0/fwQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37nJEE2404195
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wQcy+0FWumbRwDQmpOPEa8Gj
	RMi/FKhF+FYVfjt++9E=; b=QJqxAzqxRrGVDw6ow6Aw9MekSL8Es7dNHvfoF0sl
	kPZAYSuC3XrMCRDkNS8edSYZuGMmcz/Lrzersh3PrviINjDMUNB5hd5gXQEHCS4u
	stn+5NMep0PqUypxuMmvNHESg64sJhX/Rk7IQQM4KrQY2/K3+aTr51r/o3N2yYOn
	5XPxuYACWHiZP7FuEI0PgquwFf89/FHdsXCknc2dIYfEteosEQcSqFGf/eV2VtR8
	h/diV5HHBfAfZlhNxe+vTADE0pXG9FLAkpAeVlpm6arJ5uvaOn1q1d41OTLktp/U
	1mwoTWqQJfeg3TCWM7GM96BaQ781aO70G2dIJZ7V9Saf/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2a95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:00:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso799175485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700054; x=1794304854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQcy+0FWumbRwDQmpOPEa8GjRMi/FKhF+FYVfjt++9E=;
        b=bpQ0/fwQDtL4OFOHm1dly0ivP7aFBflmP/BlF6vtGDMTKsanorcDeGxml3AISnu1Ou
         sdpCByWXS6NJI+wQiXFxdsXpswfapZqyDl4UYNx61oUpGupTmmf77gGhYt61+w3/bW/O
         gXC19pcLnQnEyA64GCKUFqTYa1LifOmGdn/cobnorboM7kalUApyOkJF2L8O6g1uDkv5
         4+JtY2G9myvDQcTjkrY3MDgx2YikJ6Pxrla2y3TGDH3Y8TuhjK/jxW+hwlWuGJKhPOr3
         sxFXeg2crqdRwiW7ablJVMQp6j08dyr7bNtqO2Xh1n0YpihgdA6KLNaRSLvYXCyXXQn5
         fUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700054; x=1794304854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQcy+0FWumbRwDQmpOPEa8GjRMi/FKhF+FYVfjt++9E=;
        b=XrlBgs3/TFLmlvOi9ZP3Q5PKnDf41IA/UIEm8Fv0kViGmc53JYENx/XpHMDGCyyYra
         1psNkSNNJeYNy1inGI6k1gt7BWIyETCxtC6vk/vi8B07/c5Y6E58IBk6wjIfJEqeNLqv
         gVA4GtpoMWgu7jV6WPxjK/PR+o8Xj/5qOXqnMGdNfhWMJfAV9NavRd+DMT8g45qxQ23w
         y7icLsMMWoIJu052hVQYUfWx1OpaJNhaYFT43Iy0IU38JSgh6grmWF3Bvm8oAKdliXJS
         eBZenajQbY0n+COQluJEhEGGdrC/hrIpTDyPqpGG+ooZGef8fZGbjpMjl0ZoS3/1xva1
         OVeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzAmD4mbWKemyZ/ekN+hTNyCTLnPzKKNUJWfjuMuHt+tDh/T2Gh5MeSMFVV3ONW3aIhlo5t8LXFPsy5cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AoFzIc1lLG5kj8NFi+8jTXJSUmD91GQ/zvCzsFVrO+qZqgcyu
	EGj1wuoMl7S9hc1uV9hY56+/rOtPNT95DL/dzkS9q1sORHzUyepyTQdQQsWyrVZi9ZPE3SaM5Rn
	6i33Rcoiwd5kY0Xch0QDhz/Bpv6V0Q9cCOQ9sSzIs7LTLRpN4/TmiHFMISpfqM88NJrI=
X-Gm-Gg: AYBFou2QTOGKVmSsiCHMfKOycixG0+Lh9myyZy7dtbYP+20guzgZVp3QuZk7Q0Y4+wI
	6SDI/ninH7L8Vl0rWWGkW6UrsAtA3DD2MdG8PhgUNaZ1VhePUBiZZcoQbwY/J+qdQ9dVnYNxgy5
	TVSav8vbAI7GKJ0JyfVtbt/N6MWqCzYKTAS6jH9arIC/YH+zqmZUBNwZvM8sorp0DjhCyO+BTcw
	pKThTlW592bieIMCHkjQlhVpkPIZxR+vRZoiW7Qnd+4MrZuREfefsz0+r+MGbafYAsGgdB8kknX
	0KUqiXz4JlBA2cYCNJEAh+qpSIpo+PSvGFnb8EEotfCe0cgzWCgaONVZ39O1NL/nAQMB9zgW2MV
	bJ/5ao6alGbUkvhoQX6jFOrNrmnlDLzulAPfdnk/2D6MjfzF+X0z509vGpOWtb2g=
X-Received: by 2002:a05:620a:2a04:b0:93c:735c:2477 with SMTP id af79cd13be357-94421744f36mr2183544885a.21.1793700054149;
        Tue, 03 Nov 2026 02:00:54 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:93c:735c:2477 with SMTP id af79cd13be357-94421744f36mr2183537685a.21.1793700053507;
        Tue, 03 Nov 2026 02:00:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b393fd1748sm2640745e9.7.2026.11.03.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:00:51 -0800 (PST)
Date: Tue, 3 Nov 2026 12:00:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jim Wylder <jwylder@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] spmi: Add generic DebugFS interface for bus
 inspection
Message-ID: <ckdqxbqgjhvcppdnbhxudfx6xwnzrhlsir2ltp3yi4tj7bhcet@gvgekvvtfhzs>
References: <20261030203728.3784902-1-vamshigajjela@google.com>
 <20261030203728.3784902-3-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030203728.3784902-3-vamshigajjela@google.com>
X-Proofpoint-ORIG-GUID: VY_b9rwRXJItOcNeqDea9F3u6Uav5BHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX0p1U/bXgz0h4
 nGrQ199S9Jtef+oOj1E3HXa622KlV//bmB+20NWeD9Jm+AGHAL63g2bk3cdHc7d/kwo4+Jel756
 rtUPsCCHt0YT7LuGC0UM/I4jkR173jnPXrXNXRf6b+eXGjUfqeJ4lq2PXEid/0NkYyC+L+io/Mg
 4/5eaKl1Cj8+LzvX3b+NeAxiu86DeEnAyUCKc4SR3ZTpXME8JEmdrhk/75yY03MO3qTMhUxQcof
 B6SBGTA1JEkBu0rSIAwAbzM5xlKqXUT1reuwUscJ+4UoKUVjVtqETabev6i+Tf5neeOa7lh6D36
 pyODF2r/yoEcmnxE8RqCiN1UFvc8ivTfP/rhltzjKqmVBUWra0Cj57Sw+l0n62PEpg8BhIEfX6g
 eqA0T1lUMZHo8Q2DnYoOMkDGGcY2U85VDZX1GuwfUVc9CBbVRUPjosT8siLqWQaqEoQn4zqjweB
 BMtRm8J/x6OysPaiPug==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9b0d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=FFiHL-_0tZVmkXHih4MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: VY_b9rwRXJItOcNeqDea9F3u6Uav5BHn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX7i8xElM7BMBN
 q60cCxvOTMlQAilq7wtGmOiNKYNuhaeM/Sa5aDxqjj0AxiCNApMiBX4Nr1spEtPnmuYN8RYUq9A
 8b/jN1tJfKjMXLPF3Ovac0siuezaPhQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-10-31 02:07:28, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Introduce a generic, controller-agnostic DebugFS interface in the SPMI
> core under /sys/kernel/debug/spmi/spmi-<nr>/:
> - name: Displays the controller parent device name and OF node.
> - xfer: Transactional interface supporting register reads, writes,
>   and directed command opcodes with automatic opcode selection.
> 
> Because raw writes and commands to PMICs can damage hardware and bypass
> client drivers and their regmap caches, write ('w') and command ('c')
> operations are disabled by default behind SPMI_ALLOW_WRITE_DEBUGFS. When
> enabled, they restrict access to root (mode 0600) and mark the kernel
> tainted with TAINT_USER.
> 
> Detailed interface syntax and parameters are documented in
> Documentation/ABI/testing/debugfs-spmi.
> 
> Co-developed-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
