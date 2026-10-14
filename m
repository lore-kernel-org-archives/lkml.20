Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95E3EF0D7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995591; cv=none; b=GLBC24ZvQKxx+LhYcbTwqOYdRu8JEmwAusxPnv9IfzCHdLO7/b7nqVWEzRqDsayOxPflo5TS+zR2AaRKoSZoqQwhK2fNYuemGO20VZDyCePl1PI6zE2of6HlQ35VgtwZwtOg96GPZKhfU/aveyBL1AEDWxowKm0YZpVksMMkqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995591; c=relaxed/simple;
	bh=2SmqRSM29LOzHM3A6GRo5sG3zBqbZbnVlToBp75cpZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDze2Yx+AK7RCzkzbUfvYHtXjgaExAGNV0afQU/vC4D/Ndn9uaJPoBHtaMMClsKW57teejXEkWsDF0szTTvnJv4VGHU9KuiZM+LJ6cuT/fHJGmtoFaw9FG/LK/wBKIelQFArjgCwLGmqPPD8Kp5XRoNh9GLHBS6stYl6Z+X9mU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqiTDsgd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJCttwxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqiTDsgd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJCttwxt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpave1672232
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y1mP7tjz0hdlvUiRGJ/PYzkP
	s06b0Qc31Vf6gKT+zak=; b=SqiTDsgdAMLlg/VmmNIgi64kqSNttKz2JFT/JQps
	iKksROTi5LtbCb1iExe4VZisxmOjTXSc5qY3t8AzLdITJfAWlerr7dcHOC7eEINz
	sF+ScAitxzJlBP1QjlE2/AkCuvXB791xdhi+ZRCGaDPfUEb7Kkl1JGTDQViaSbhL
	So+U+1rVlO/FkoV7beVyz6HNoB7BDuEj9LpMcYxEHGkxAglspqlQLp5RUzQG4kJx
	IODHbTrUuKVWZkivtMbvTOvjkYg7XBYPRwNU1zIP5BB4YdPKfJIYFIC5ujXoj5Fk
	f8sCBjpJ1c9AiSNNLdA2u3LwWLF6/0xYFgX5cT4uxHl88g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh85qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:33:09 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e93d46f76cso1120253e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995584; x=1792600384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1mP7tjz0hdlvUiRGJ/PYzkPs06b0Qc31Vf6gKT+zak=;
        b=jJCttwxtRda6uGs15dxXqUyZk5bXk3YdXN2KyByf7q+rVANKzbacDYDTGKEmEI8S3W
         MmLDLZOXEAB9PsTrFYT0ehSEF9+vyx+ePDIkvhU/eNe0RHmbqmFW4jNLG3T+Ryr+988/
         LlJRvDyVUqoYfkGeI+49SZasvLuVmNnfNqZJ6voM2ygIiuUY+nfmPBlBYoJTaUR7iQAB
         M26x0xDWgw+Kgtv+uB2+oQhu31fcg1azsM0qRRmQKoqyzoPkZt9BDUoofW+v643H4g2+
         DRObS6KRRmV08uoKzrhe4NU5ChUUWDAz80ACs/BET6QTFztGQr0QFM/Qh2trjIDDPlbx
         f1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995584; x=1792600384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1mP7tjz0hdlvUiRGJ/PYzkPs06b0Qc31Vf6gKT+zak=;
        b=w+3jZK3sQ2zjOePfiNM1b6BOgP6I2t9VXru4iwY8S0rdXzNy5Icv/VnlkxRZ/4157w
         k+WW/Z9FnUVpVNykqpeKwbrU0S1FQ9dm2KAJu01M986+ihk2LwFNHXllT7rM4i3aJjVi
         +OJwedeRjy7YL/FTpAoS2SlF225mHRzfdD6rRXWOycuYWKLSqt7IahGkia91MMFDvZ0j
         pe8UtEu4TlUzVAVRapDjK30Q6HgojC72myzgtxggh53TGWchMlIC0brdbScyNnAzif6T
         bPKxeKh1uc7ZrBXnOmDpl9WaiLpi14Z+7dz7Shce+RhmXHensVigrtqTMYtJHvOufNgF
         vmtw==
X-Forwarded-Encrypted: i=1; AKwUvBwtGKvoe9Fg+94dimV36ENAn/FnFQ2b9c0Vtip6ahurXgWEz7/yLUjhtnQokIcNUr9hLV9TMouUW8JY6Xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaIHxWbl1yXC6DHut6ibGWBzb18RQYpiAJZT05DzDzDOzncdoh
	+OcX905yG13AltqNPBP2NuLOlIO0uk8yk4QfKghD/E+iwtt5QouZaQ5zgJLfHf/83YfWCA8C4Ej
	OTZUwF2wV3vHM+21L0FfSBWQWWjKxCnQUBL5fDHaD7RdWoCqvB7j1DYjTUsYYhEpsfrU=
X-Gm-Gg: AYBFou1vfvjYPryrXqmkboVMQMKPV/MIw8EXx/TLCcdd2ugEj5Vs8Z0cdCHSOYNxM+s
	Yj9nYu1b0lNJ03E1qo1YsbHrMgH/nQH7YM4naNs7DrbABRhBfa1MdcYHRcygSgN0mfE5xQnjvvp
	RGCaEW6neXv99JoAHjP6l4CFY33oVN9zdYHMgFEhEGz0rXPxZalWvD0ALG98cPc9lDgBs/Aicxo
	QKO3H7tLipHJneQBs/07k8QsgR65MGk2fQCkdQVLusVolOKf6Uebv1/hk5YOp1H7MB5GfsiNwU9
	wz1uhi8LP2BOKs4KueF7ckl6CmCXy83n7mW0ykh21e1lfphiCcEISUpnRfWIFg9nSc0DleSGzoI
	ZevIzmKtzGpby1g4l33XhrtMyG2x/BZjiZYpLcJ4cxT32VoxeDS/PGXicxfnIZlAvvFKqbTuLc5
	sQ6gquKPZI5KMF
X-Received: by 2002:a05:6122:20a3:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5e91f5795e7mr4855539e0c.22.1791995584469;
        Wed, 14 Oct 2026 09:33:04 -0700 (PDT)
X-Received: by 2002:a05:6122:20a3:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5e91f5795e7mr4855515e0c.22.1791995583701;
        Wed, 14 Oct 2026 09:33:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm758352e87.66.2026.10.14.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:33:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
 <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sy9Ocsyu0OW_Db7d2PJO1c2QoIhSmWx7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfXw4zHcN/HpFxR
 aaANrdlrthZwK14zQ4Oc5b3xTKwMSKyE7opbhJjuGQ4ql8Ibm7FI+ucSy+0iP3kt79jUUT/1zp/
 SY/0Ci/o+WH7dJaIkpxUIeG1KgNEW90=
X-Proofpoint-GUID: sy9Ocsyu0OW_Db7d2PJO1c2QoIhSmWx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX5gysYbFCJzXe
 vAaYVrywzoNY6vpYlF7faOBA//7CkY8jChgn0biW16B9Bm/tvIsC4ajbbhH58VONEcnlsENQIWD
 IaqKUd+qxeBYdxusf/YeLsCibniCRg/3JsNI33IR2tklnAJBtnw1bYgugrDdUfRck5L1lMgXxaX
 KMGkE7YSdsrjcIIYp+Uu87pH1jtZ7ftZlpo9RwJT6d6DVWgjXyGvcqLxxeh2/iZVyMeResDsbPL
 j4R3p9g5TVLh/gJjZSrqxPX4RBI1BEjjm61DtXYLnbwXPDxs/LTuuirqijOor8rgMdFN93WYOcY
 uF5JD/Ac0zszkYuXhrunyys7HDn3a8AR3RZyg/VTswpa+Tm6xeXMyuOQZMU7aIW6IsfNgJuyXCq
 H0kKO2rAIC2QbiR88b4+CS/6/EN5L8tQWMxrz61Ev1lJ/noF1s2CnEhkg02E59CFcvok8P4xyDE
 589vkKuy+7D7mj3t3Fg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfaec5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=q1GH_QlswVeDWWcc61IA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140065

On Wed, Oct 14, 2026 at 06:14:43PM +0200, Konrad Dybcio wrote:
> On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> A failed OPP transition need not leave the clock at the last successful
> >> OPP's frequency. If hardware changed before the error, the default
> >> single-clock path can subsequently skip a necessary retry because its
> > 
> > What is a necessary retry? Shouldn't it be: try, rollback if it fails?
> 
> The failure scenario is:
> 
> opp-table {
> 	opp-400000000 {
> 		// low
> 	};
> 
> 	opp-1000000000 {
> 		// high
> 	};
> }';
> 
> 1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
> 2. A driver requests High.
> - OPP raises the voltage to 0.95 V.
> - clk_set_rate(..., 1 GHz) changes the clock, but returns an error

I thought that your previous patches actively target this. I.e. if there
is an error, CCF should retract the changes for as much as it can
(assuming that there is no extra error on the reverting of the clocks).

> - Assume clk_get_rate() can report the resulting 1 GHz rate.
> 3. The transition returns an error, so current_opp still points to Low.
> 4. The caller tries to recover by requesting Low again.
> 
> Perhaps I should have included that in the commit message.

I think, if something changes the state, but returns an error, it's more
or less... an error. Or a bug.

> 
> Konrad

-- 
With best wishes
Dmitry
