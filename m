Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7836196F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852864; cv=none; b=JddZpPXktNXSfYivhma9RpU71tu9zuW9r2K6b1NGm7NfC8wNsgl4+UCqzDCXQwB+pfjubsvwD7WYiZPZfh+/gVmvxEaFrETEP+p2mhWgThEWyUzHcrg4S/BLWbUiQoyXq0a1hsC3DGYdp/y+c5J6g/FOHPh19iN4i8kuHI4sj5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852864; c=relaxed/simple;
	bh=kTcbf6zMBF7quyjwgGeI7I3sau3/PEf62+p8Ynm6Ouo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuqBaGm6/Yc4Q+lFZF0sPp2lZb7fg1Sj2ba8xFAJWgvAYHlRyXa01saGAF0siBZeco21CIQyGKi7aphqcsudbbfaR2Cvtwf1TsWMnDjmG3Vvqu1D3RZOTASDrkXYuq46z29l0jYJwv0RiJyw9SczuORg4yXo2J6hzlPDBBoQPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFxI232U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAXgKxNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFxI232U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAXgKxNQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Ll7t1477673
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zSUX4rmxFz9Z2gBtnlzHh970
	/YgCNq6kC/HDrBYmw8M=; b=LFxI232UImGoY7CUSZ6Azl+dcEDUwQKxtpApVysh
	xqZy4LKcKVNXaYqFGA59tnRIT7hPrkgf7lpQZbb5zFGoaHeF9zaxBUuN2pf2/MGn
	G5Fu4F/dh+IULKrxawsg3O3/whmSgfK1CtICF8l5zwD/XIgRuR7wcOXDNpqT1J4Q
	3owJ5mEbD7QtB9fgifkg+uVR2Pc8Q779RMbZhAUZYY3biznfU2YswSe7f88Q8tGs
	gph3d7V0jWgdncXbNXmUTlQVLQ3dk88dy9Qb0cdmajRWbTPsQj7PD3r+wz1XfTGd
	00oy3PRKLyKztw5UEZ1LXSUBqyuFdbXE69hccD5bwThttQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgsaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:34:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939694871aaso684636885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852861; x=1789457661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zSUX4rmxFz9Z2gBtnlzHh970/YgCNq6kC/HDrBYmw8M=;
        b=BAXgKxNQM08czM78/L/352i8aKR5GzyzbqjGtAZS3lq8u21uLMMxljlsvwCM1FPh8u
         BFGqoOvDyDnEnzTquj60cark6lgE2F9Iz/NtcKZopOTnqj7Zlfswh7lai7Q/ROwmZSuS
         tL3qDu/VahRtKIU6q6LAOToRG1KMejAbPQm9jeVzXc/rP+Axd+o8TiVaFjt/fW/M9zSl
         uDpxlk9qqIxwy0oCUBYNtDC2kAd6puvV3LPoO5SRfo5FRXppCZKATDiWwheM/m6eFiZz
         uAfPH4OUjNZt+va6dymfYyHXhV/WyQiJ0aqup1ElSzbcI4SAb3Z2a8wdeCQK8hAQ9EQV
         SRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852861; x=1789457661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSUX4rmxFz9Z2gBtnlzHh970/YgCNq6kC/HDrBYmw8M=;
        b=kF3aObjZI0U0JAgZ9NfQm4/qQwyMWZFgy6qqCOIIJvbvDLDy9cW+481RRifmuhYdPx
         18ERAWoI+5D/IIt07T0gf3gvojtKolegxmtL9NDFKqmd//vxyP+2qdEk/tiB+wGbhtRO
         J9SVauUBzXc7weZpkk5qA6i5dVu0ENpzOY8gouLoDkew2d7QJ/0OH7N7nxwz/+xZAYhS
         6gfL05slmrr8bd6qS/tB4C7Z6Ai6xCMP/hN+rE6jdBzqtP+jV2NZJ8MmX5gg6chz4+Y2
         /cRBhBVBB/NaAEhIzHSKg7H9HU7DfiCuKc3DChFhNLKZXfWaWwie7B/BGFqaEKUrdrnO
         +Zww==
X-Forwarded-Encrypted: i=1; AKwUvBzS9oZnuiuI1aXkKfItFY/iDWprWIVOjF14f3rnmWuskgHBAbFCnnJ/vJXuSUFySSq0QmB8W3pDASuB/TY=@vger.kernel.org
X-Gm-Message-State: AFuF++mRkoegVJzK842tYgpj81aLOxsH3nLfduVNjXrcfn5ZYHFymyJ8
	u7AXMwhsp8paYasEskWqTqjeGnnmg6SZiaPemcrE1PVinOl+Nyq0yiVFu6yzz1gUG/AuRIAio3Y
	nrdXX7uRaHbA6I3ebi0gJZotQY878cGbOqE6D4+s4Cj6W0xhRZBGKxQLCLZqgOiKR7To=
X-Gm-Gg: AYBFou25iPSBdWToykICR5LjwHUuOFRihVqWdV4BG0MCfy8andxPztgkh8abQjjq5ic
	IlDMDF8pj72CBs/YszRfGHyptonWZMj3MDvOPGNoMJY1ykY0uNmP0Z39JdCoHDOOBECAAMAFEe/
	FYwHIcXvBtUCUnhYhjzgi0omBlB8B5ESlYxBEf/7aZImdmEK/vYSzwJDnM3aoUg32shqt6Ysobk
	4BonEzyj2kuY9hv7KSrwiS9XJni3UPE4yyfXMRwiGuRv612FtZ6TRcdLKhrga9RI2styFZ/Ax9H
	Ze9QvSiO0Owiw6CMoOEeKJlBM3bBNL9YR/KJts4v7m5D60fHBausg5gXvRCPs3XGhstZNp4H+9P
	Pn4t+7ar147c=
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2956893185a.36.1788852861040;
        Tue, 08 Sep 2026 00:34:21 -0700 (PDT)
X-Received: by 2002:a05:620a:7087:b0:939:7f87:ff22 with SMTP id af79cd13be357-9398045fd75mr2956889485a.36.1788852860466;
        Tue, 08 Sep 2026 00:34:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm818612285e9.15.2026.09.08.00.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:34:19 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:34:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ld9c4vc2.wl-maz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX2MkuwDWo/rZS
 UdSUJjK4BGhgoDMEGQlZdpbq6nQgUKs+sUloZFQYwWWitpX+eHE7uP4YhwmOqYEa2YKMFqXklb5
 xbVO99rf62xls538U//8DO/Im9YhcT0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX64+ChD+JkYyn
 eKpLOOl7FLjDz34e6vd/fsWn5Tf4APw7gMPfo17fqJDMlc2VxVl8kUcgPp5J9LhsovonnwGSUas
 8m03ejbVJqMYuxMer5Ty8GmzQFWC7BGNLKGUd6NY6CRMW4r+Ig/OKnDf7a7nVj/mPwSZcOTv/1l
 q4UYUrFch2YaPYu0lH4jTJSC9efSL6ZTVtMgqVkwrjIK60c2agyNk+6MkMmHQW/DowgEuHmNBIS
 SvCkTlb3WsDHF5cCl+Bt4cHNGeyEk3RE8T+WYgObD3kdWh7R8k4A8bVzz1rsZVazMYZjrUOGMbj
 FAsbn31lpsYqmYkku4yBFt4nj4nnz0cTQpdoMsFHuU5vPD50i1cCLQeN3F4c2jfAb1QG55BFdtZ
 ipskMyqaOUT5YgO58sS1JgNEW8vyqw6TgUck/917T/XhUsqYfbNtbt+VDT/OQmF6+BYg/Y1JbW4
 NnnoLfHU3PZEJtKDPeQ==
X-Proofpoint-ORIG-GUID: qBVSHuRAQGQMo6NRmDQ9pbHwZbbf4EhA
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fba7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z6oAIkbW-EU95i1wH_gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qBVSHuRAQGQMo6NRmDQ9pbHwZbbf4EhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080076

On 26-09-07 22:15:09, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 21:21:44 +0100,
> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > 
> > On 26-09-07 18:17:29, Marc Zyngier wrote:
> > > Recent addition of QoS configuration to the X1 variants resulted in
> > > systems that spontaneously reset at boot time or under load.
> > > 
> > > Given that this is both very unpleasant and hard to debug, give the
> > > affected user the option to survive such event with a module parameter.
> > > 
> > > Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> > > offending QoS setup.
> > > 
> > 
> > Lets not start doing this, please.
> > 
> > Can we figure out which platform deosn't work and then maybe we can 
> > add a quirk in DT per platform?
> 
> We have at least 3 machines that are dysfunctional since [1] was
> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
> going to be the one doing a survey.
> 
> What really should happen is [1] to be reversed until QC figures out a
> set of parameters that actually works, instead of making this platform
> even more unreliable than it already is.

I'd rather have the patch reverted than adding a module parameter which
users might not know about and distros will probably never addopt.

> 
> Just like [2] should have been reverted.
> 
> Until then, we'll have to paper over this stuff.

But a module parameter complicates things rather than just papering over.

I suggest we get both reverted if they break existing platforms.
