Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E273E1692
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792367593; cv=none; b=MuBU63PoQh8Txpi0N9rB2+QhV2RlwpMTDHEzv9Tz4NQ1/S93Db+jbx7TnmwAhkm5wmfN5qqwbrcFzWoHQydkKkgA9/elLCxRxo5GE51V7XQqemCnPAGqvL890fUDhOg7/lFda6kr/n6h6M0+cPR55/d6wf3ely8Uz5kDDSGfLeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792367593; c=relaxed/simple;
	bh=6g5HKqFJHy+jPg5eI51EkhtmHAefO2ruYtPIveQKssg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNFqk1JPLQ52i+EELIVzJ3LeeobepCkWUG6dK2anKum60YkxbFiHn27TO05xcZsAx9jB31HVwUT1KpJAQ4WQEUDro8zQabBAmK42njPV0NFwlbJC6I2/NUgYxhXrFqQSnmMzlX4lc4qPL+5gL0bBPcS4yD6nXT634BcViM1tNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvdU+p5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfGYZBv7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvdU+p5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfGYZBv7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ILjC9w3568604
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p0UcZjLCI5EsaKXVYEifEeVT
	wnpPCrWb11gsbObd+YU=; b=VvdU+p5P2HVWGIS4IDl2/9rNdQMdmpu70XGjiIUY
	9xHLxWOawWeirSqftTIKVKv6NbgJHmQWMi+0W/CKA+JzhkyWi+g3cy9Sm5yCSIhG
	huY/BmDcqjOHV3qZPkCUoZWYK0ReofsIbivraCWuYwvXCwyCIFqO4Keu2tMwn6BC
	dZeYzOA5OrY51NjeI7U5h/3mByROVrnmAb5SQDm+Lc4K32xxKsBJDRTLlMuk0K14
	ivOLMc3VJYrLyTB5WhtjfhJ9p+dVs4BH62+U0afgjCtekfWdeTuLWZ/L7WBvFiKs
	xq7Kd/M/HhlIuUPFznC0Wd0+k4ZjG6xh0s78LQm1nego9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k4127-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso137631085a.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792367590; x=1792972390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0UcZjLCI5EsaKXVYEifEeVTwnpPCrWb11gsbObd+YU=;
        b=dfGYZBv7HXtuU/YG6FHj3A/85Kw52GTaPFEVGAnZdrCmNB8u7bi1VINRrj/1qF/3aQ
         8fTx4eJg3IIKF7aPAf/PzYd0QC6S60sYGPAU/syn5aeVhoTMax6VYwd6g1vDSpZoR03T
         OviyiwJj+Dz174yiTKU3qcMqIQo88h3cM9VMBvjiB2FODJA6WBpjJRF+1D/ojt5WaJUj
         SXusdtykdp+1qx2MLtGZbE5wd6Afuwc81TRL3xQaR/ekC3r1ScWF2su9UR+p6lxZSjxh
         sXNIqsAZckDXZx9D07kiZPNITh03Cl//9JbxyDtxso3/cPeo7ygUIhzuNnzWboHbYsbE
         NxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792367590; x=1792972390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0UcZjLCI5EsaKXVYEifEeVTwnpPCrWb11gsbObd+YU=;
        b=pNtXAWcOBgwmixWycvsNsziT25r6zpIwAMxqDOm4f5nzRsjSnWkA+spn4ojWKlcq98
         LFjCUguUlS2aQzQrjllhAq9Ip1AsoDYsq0szgI+hA5CTLLG5b9+RMryd+pwPLUFBEens
         KsaJKa7UvjbTV5hXRyqD4Oil9MzQhk71itLW0tTauWnG2YEQhGNMD7cYOVByvxdDuSTP
         MrIxHTHvy05IicUqp+a+BBBGiLk+exYM75SY0l/Ci6Uehp2FK9yh3fYISS/wFg5AWwNw
         BAPsgcrojn1VtRAclGcuiRPjef5vYrUXXi9U0dW+BWU/eX85R3ZWQSdOyH8wxcAOauEI
         GjIw==
X-Forwarded-Encrypted: i=1; AKwUvBzOdi69LnKe6wazSIG3BJhfHdORnaT/CNyREFy2ydDl/9T5HSIPnTrfJ3fAzZo6OE4ZJ40pQswTRFYOMzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXVzZ/FhiEGIWs19cfh2aODeOEk8OzmeTlrkA453EJdvoF8Fap
	bxwyat6SY3TYIh6TWsy+AUIijaSJTVHG/bnxJPf9w+MLg+dvvWrJ7FyRXZdVtctqVYtN/lyH78+
	mCbLfEY4/0S2ISCq3IYvH+3aEAUK8qjHuTpZn+JJGwQ4ADAthGQvZ39PXkO9mdAphAcI=
X-Gm-Gg: AYBFou2knwZdQBQeMSG8hLLA/48NzSkNLtMqpaAt/d/9yHH3CHVi63Un8u28QUyFifl
	Yl3IOmH5kTh/wcUXLH8xmjSt8Y066oW9DL+20FbiHQRKCoEYXqbW3E/9MpDgy2YTXOsSXehUoa7
	t+ZDDgSWeYTUHnJm81ZQo5mAJjdDI4cKtK7XZcPdUXMFiJpRwQ1hzrPRZHdCFKy8EcMhx7kCYv9
	JeJOLHVstv4jqkU/UTFvJfOwV2SY6FMOo6RWO39a1Bi9VrrnGPXiAu8BreiOhrwKOCslPR4CUi4
	iCDaAZZPxs56Vxg/pn4qGBrxGzuIScyHMSypI8dKJu+JxLUDeV2e1HZmlYx255o0Z3V7pOIhRqp
	FZ5JV0reeRn0QxLgdBvwIhwPO62p5hmw8AkyD8uHmvh2epef5z7eMCrf6by9EepeHuriaWbmLeV
	ZKn4k8OLAcmvKk
X-Received: by 2002:a05:620a:a181:20b0:93f:2479:2b4 with SMTP id af79cd13be357-93f247904fbmr734308485a.10.1792367590042;
        Sun, 18 Oct 2026 16:53:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a181:20b0:93f:2479:2b4 with SMTP id af79cd13be357-93f247904fbmr734306785a.10.1792367589543;
        Sun, 18 Oct 2026 16:53:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm1616881e87.14.2026.10.18.16.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:53:08 -0700 (PDT)
Date: Mon, 19 Oct 2026 02:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: David Heidelberg <david@ixit.cz>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <eodzuccugtdn42basgpczett4yatyirog4nxwe5rhg5xf46ibp@jzcjmje4aqc3>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
 <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA5NSBTYWx0ZWRfXxLl5FxxFj+iW
 Z6xZok8YKJr4A9JY504uz1XEg1XDAFNKwVyBHMquKd8C7SXNx2Eltj28tX6KRVhQfTU9eZhqswY
 OyIYOnwnUUIWe45zGASp98RU/IOSXoBvRJZ+vxfp+iF7va+EMnoizJGmfWwp3VtuYT3Gc7BjDy7
 87ojoBgSoSsShmUKbFc6jJYBmSMIdi+GA+ix1zDvC8mMymoU2+/M6AIFDRuR40exVOa4xB/P79w
 l++yg1sxv1IRRCFt446cl3si2gI7p0Cz4LLo7A0PaiYlxyz3D0LbUbgj/ljQuw78uMVjOrramV6
 Pu/sPy1wFYZ0dPajQ0qoTddlM6IwqOhP984GJNeSNzV/+M/h7jGc9b+fRqZU7vje9+nSh/ovqOO
 PE6ZzWiXySzh5od4WPy77TZnHioxOyFQm5c9EVTkylZZDrReMEL4Roqyq7l9YpqLQsBmI+3C+SL
 5WLjJ33dqZSPtJXJzWQ==
X-Proofpoint-GUID: bD7BUnSnQCkfyGCPboCbM-p5IQUJsQUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA5NSBTYWx0ZWRfX2Hw9ftwQ1ljO
 gXJyIvECIhNhXd10Dzl4MGBs+u68lENEe55GCi6bvCMXhjmUNeRLq4jNijQQvb080iNZEyUQwvZ
 9wxv9wJ2ohKvcK10jD3CVpxtYedLYkw=
X-Proofpoint-ORIG-GUID: bD7BUnSnQCkfyGCPboCbM-p5IQUJsQUL
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad55be7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=3RZNE-nbyhM6VGf7PbYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180095

On Mon, Sep 28, 2026 at 04:54:08PM +0100, Bryan O'Donoghue wrote:
> On 27/09/2026 17:33, Dmitry Baryshkov wrote:
> > > > One major comment. As we see, on SMB2 PMICs parts of the Type-C
> > > > functionality are provided by the charger / FG device. I guess that on
> > > > SMB5 PMICs we will get the same problem once somebody tries to implement
> > > > additional charger features. Would it make sense to rework the PMIC TCPM
> > > > driver to be a composite driver, taking several components via the
> > > > existing Linux interface?
> > > As this gets decided from the QCOM side, I'm fine with whatever suits the
> > > hardware best.
> > Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> > components be fine?
> 
> I mean maybe. Would it not make more sense to land the TCPM functionality
> and then look into adding charging moving then ?
> 
> i.e. finish off adding this piece first

The problem is that we already have SMB2 charger, which accesses the
same region. In theory it is possible to say that USB-C driver conflicts
with the charger "for now". In practice, I think, it might be better to
sort that out from the beginning. You didn't have this issue when
working on PM8150B support since we never needed charger for that PMIC
series.

But, then it's up to you and David.

-- 
With best wishes
Dmitry
