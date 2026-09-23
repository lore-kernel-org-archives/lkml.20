Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC74C57C731
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197139; cv=none; b=TKMeGEJ3kNMwj0bY98LTXfYoWLsNjihi5veybCo+m6e8ZekPp3fepu6zeRvYdMELqdjnw2J0h2KuKb4M66t4IvwG6x/hzaCagdBfUybcHmoylf0DIWTajsJt30o4nHxl5tDNv8OhjDgptRZUcnnqd6Taxs+ZXXvbBD5njPKRJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197139; c=relaxed/simple;
	bh=vXmFA334QELe6ci7/KaCWn8302UvmFUJuxHATZA3VvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP7CqDAn/yCpNMbO31LcEKFjkMyvfrh3NkoYIrS+/HhqEXu+mi1CfK/oFEzrKy6ABTCPji3FnXwt1+5kkeZV3rR1dAi/Ez6O4+ammQOb9mSicn9a0lrMVm9UhL8eEaXFoAprxfJnGRAmf40V4Pu0VXOuH7Bpsf7o4JS5OVIwL1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRPJ/LYX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kw0berKi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRPJ/LYX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kw0berKi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJlIQA3513976
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov2H0d6cnBTnjw7zlHO6OeG9tF0HJ7AcJiwrP6JidQk=; b=NRPJ/LYX0U54OgoJ
	g+VLOhVg3+gUpxMhVOirA+IR+q22MtJdnylA9VJX2oDP07y5UqGO3L9PxrnaRy6U
	3JAUVFOt/t44h3aFWJzE2MbhDLY47uv7A1URB2720RIRUXx2YYP5nJKRNNyoqhI9
	xapuPAdFspqTsJZ3VsEDk9pwu1wQ/vSG5bxQY72GihUD4pznEJFoQemg16NgQv6k
	17+piWr3c+n9ovlf3lEg8nSZkK9V6GjDm8zhHnyzennnBuGoPqml8jy+941vxpWt
	4GuTWZj06Ggot9Pp5RJ0dtZQHpXKPEu4/Iqr8tr4PVoyb+JwJLYGRNw4G9z4Rzd+
	Psc0nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7jx3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:58:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso164182685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790197136; x=1790801936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ov2H0d6cnBTnjw7zlHO6OeG9tF0HJ7AcJiwrP6JidQk=;
        b=kw0berKid1mnEZcFDMXrXMCX+g3Kfox5AVgtbMte6wCMgOn8db/NGMBnS8xjLo/E/p
         qWCGjb+n4CWFoYWN9f2qIqtySxhICSLdp1rPzRfoqsBHPS24cU80ahSJoZXKbw/yt7TL
         SoTUU+BWVCnf5RmTX3Cu4wQ+VdZpPQ15TT8szNesKI8ZL6k4qNtnaB25QUCKrsOoDEeE
         IMLtRKNqGU/M+Z8tJakH6RT3T4PmA+kjH2qVtC0cdW9/Xo9I/DvyrnYRlneMYsDS80ZZ
         m9jyWnxlN8W+zqgb/VS7DIDu5RDgVILuaeWQulkEi+xKJzb5nye4VM9b6b0Mnb5UlUEQ
         B1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197136; x=1790801936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ov2H0d6cnBTnjw7zlHO6OeG9tF0HJ7AcJiwrP6JidQk=;
        b=oKuGO/dXeLYQuzvn6l4Hd+yOXoMe1cTyYf8vPiYhhyE+pRR8O91nUDVggtgbBUpfny
         /PSrEouvc+gqEzTJ7gE30XbAOgOSkEWHKKCPZUH2GyYIcHCg/v/WUnCq+AAEa3RJ425p
         50726dGSXocfggNBBQ7l+Me2TvTQ3rhK/duThCAsP+S1TjbwERzcaV7zP3uWdJ5jxAjJ
         IwcXcwWsTLRY3SJtaCywbv5h5b0WX0ejSkDRUKFD6ufV8VRtPH4NCCUNDoW0KJxbDe+f
         INu0cgcZrsx79GL/Wnz30qmuCNPyjbMJpvH5nSpcMeXfuOKCQX4zxdbOHAcH0SPwIH0i
         eA8g==
X-Forwarded-Encrypted: i=1; AKwUvBw5yt+O0gWe0SWTUrG1/N7UHgAaIzCln5X3TEXPcYLxEyKFFpE0IwRN0tJ5NyL0oHmPH7rxrUmQ2frC0NA=@vger.kernel.org
X-Gm-Message-State: AFuF++mwOqfjxoqxbfTiSRp3w8GpLSL2Rdv/u/xBBrb37QxdCmQaAXr8
	4lIlf8hbrMbOzpBH+xctOZvVJLc6W4hKq75D9VL19iBMWfKyCmbpE9o4Z6HumitLuVySbu7+PyL
	DLDBty3qqdgPQo2Ez3aM9lgPYsD6J3eqMIl5iS3sHmRCmmoP4sbJ9XAh80bZOaJ8qeds=
X-Gm-Gg: AYBFou3QWExVIB5IpVY5ytppwBX5q0aRgKmcGfnNo6a+fejfESBHXZnqyhU236Bb4x0
	EVYQt4eUE2RqHcajbkzEy9CArFA7pBDie7uRoCI9faJTllNOzL8Rep6zPdy5byPZh6VNJ5SmfDW
	tjVb+lJs9g47b9QxlpjAQ8OmqYJRX0y6KQXG6FAGQsj888jU8WOwMUb46yfSpr/a3k86JR2LzEm
	8Jt7rU+muoetKWac4PTpKrdh6UvrkcLaZ6psccWExZ2d0PTizpRzh2Bz/EwgoBHNGVUZj0X3sDP
	Ltq422R63es0AfLoBiXLxdfZDLaZvXEyHAriIfug3stuxJsKqPJntC+Jk8LUGxl8IV7+NdHCERw
	NO6bXsdlK4W25XjYGoVPAOL9fXL7jJCbNmIKznH5JVVtgTwmSqTYi5oa8wJU785BMdl13xccy1l
	wBIwBZCM6mpBkf
X-Received: by 2002:a05:620a:4415:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93c348282c5mr60118085a.66.1790197135576;
        Wed, 23 Sep 2026 13:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4415:b0:93b:d7a2:dd32 with SMTP id af79cd13be357-93c348282c5mr60113685a.66.1790197134958;
        Wed, 23 Sep 2026 13:58:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d9b9972asm705666e87.18.2026.09.23.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:58:53 -0700 (PDT)
Date: Wed, 23 Sep 2026 23:58:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <y64m2frbbg67zfukyuuds5cx65fx3rjxfujbckoerv7sswhk2u@i6p4k3ul4aec>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
 <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
 <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
 <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
X-Proofpoint-ORIG-GUID: woAO4hMIoi9KsnbGOX41N59mlQ_Sza9f
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab43d90 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Gbw9aFdXAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=f6ktmeKAyBHkVzSEkbUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA4MyBTYWx0ZWRfX9HO2LSTLB+L4
 VWgftlG8cXh5I+vIWhKdYPleYtfnGoI8f3CI9aTcCASQwVShN+IkX0luw0pNZgGW7E8i1sR3HEc
 i6EeH/L9ESN7QBjpmPCltoZi1KM1wSNQkGlOjJ7GIxJBUuGEo1b3rBw6vDfyrwPwgTJp+KGi8AH
 vqGQEv2TkSxs3OL9q/KNg6/me2hRQisY754yZ+f5doJLg970LZWRy4a5fOIVjBfQfUH1f7zkb0Q
 6YCTc/tyY9OSdBeKdUhNzaiaoEBQRn0S2qZjO7VmGIlATia8SPBYURJiuKbdPmFmdrlIBwcX/HU
 iJncRk2YMhujmobyNmkkfQB2T0tjfMEUXlkK7Tvn9pIW5Fe3dkmGk60HyhUcVh93RMqVYCFv2pb
 WZGRfqq+vVDTgyV7esXIPiJyLn4+od/BUVal9nNdnInjaxpwmkBsIZpcArpEAw7VUiIaBRvBN4S
 q3jbBPIT13Mm9QlR6Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA4MyBTYWx0ZWRfX6F1bAyj4XVIx
 17YxgRqbMNCpnxszXDw4wnrfaiUo+cUOnBPNDLKS8S5X7glbAuhQA/t3TIyXlM8W9Y8uVS28z8W
 r7ni9el3g5VZRcm2usX6lkYTzoedpso=
X-Proofpoint-GUID: woAO4hMIoi9KsnbGOX41N59mlQ_Sza9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230083

On Wed, Sep 23, 2026 at 12:48:21PM +0200, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 7/8/26 15:31, Dmitry Baryshkov wrote:
> > On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
> > > On 7/6/26 11:52, Mohit Dsor wrote:
> > > > On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> > > > > > On 5/4/26 22:09, Mohit Dsor wrote:
> > > > > > > Sorry for the late reply. I am attaching clk_summary and reg_dump in
> > > > > > > working and non working case. Lilliput is just a normal display working
> > > > > > > with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> > > > > > > Gen2 only.
> > > > > > 
> > > > > > Neil, Dmitry, and Mohit: what's the status here? From the outside it
> > > > > > looks like this regression is still unfixed with nothing happening for
> > > > > > weeks now. Or has progress been made and I just missed it?
> > > > > 
> > > > > Thanks as a reminder. Unfortunately, it takes some more time (and I've
> > > > > been a bit overloaded lately). Worst case I will send a revert soon.
> > > > > 
> > > > Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
> > > Hmm, no reply. Given that we are entering holiday season and are way
> > > past what Linus expects in a situation like this[1] I'd say we should go
> > > for a revert, unless some fix shows up really soon now.
> 
> Sorry I'm very late to the party, and checked again, reverting this breaks all dual-DSI setup
> on SM8650, and probably other similar SoCs.
> 
> Here's a complete log of the breakage which appears on the Ayaneo PS2 running v7.3-rc3 with mainline panel driver: https://gitlab.postmarketos.org/-/snippets/65
> 
> I don't see why my fix did break this use case since it reverted the way the dual DSI PHYs
> were initialized to actually allow the dual-DSI setup.

See commit cb55f39bf7b1. Without PLL_SHUTDOWNB and DIGTOP_PWRDN_B most
of the PLL registers read as zero. Currently the regs are handled
correctly (almost). With your patch in place the SHUTDOWNB gets dropped,
making PLL loose reg contents (and return 0 to CCF as the selected divisor).
Current code depends on those two bits being set across host_power_on.

> 
> Thanks,
> Neil
> 
> > > 
> > > Ciao, Thorsten
> > 
> > Please send a revert.
> > 
> > > 
> > > [1] To quote Linus statements from
> > > https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> > > 
> > > """
> > >  From 2026-01-22:
> > > 
> > >   But a user complaining should basically result in an immediate fix -
> > >   possibly a "revert and rethink".
> > > 
> > > With a later clarification on 2026-01-28:
> > > 
> > >   It's also worth noting that "immediate" obviously doesn't mean "right
> > >   this *second* when the problem has been reported".
> > > 
> > >   But if it's a regression with a known commit that caused it, I think
> > >   the rule of thumb should generally be "within a week", preferably
> > >   before the next rc.
> > > """
> > 
> 

-- 
With best wishes
Dmitry
