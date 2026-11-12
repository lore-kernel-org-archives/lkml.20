Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470670;
	b=1ZWMFZ+MqUSmDnHH2xvDpsPR1pDlI1KzBoYhnGayDZauJQ7dKxZ6+cjD2eu4bdT3D1U2
	 OUzMcK7uWg44vJmhMPtjIW+JpVr62Cm/VP0kRLgR85SWDcbU47JTCRqSsCO8sMRE7SkdG
	 6bTPejWlOTKrwTk34QOhwwdkT6BG1l5dIyQkfWNRyNLrfXUlKQ30LWtKFzMrISiBb8Ibl
	 qHPAw+F0Rtsb0lxJ0O1v4rxSxUHvp5CqfWHpqPLfY0bgRLkpLqE8xKj9MHvZnSjD1prII
	 IHJAoiM15nhWTZQLfXeDnflPehNpb7rlKLJH0N3KiGvdmlbWoVIdEiTVarXiQDNVKQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FHdDkmm9qQ0sg08pi6fTx+CVVlQ6MmZ0qIxULw4ryr4=;
	b=YBmqDwDOg2cvvaooYinb4pzT/DjQ+YqxEK5gJvbFZM8C5A8nHArZj69W2YNRyq2arrlH
	 u4P/E4w+MZWdpnThWiL56/Zc0dOXclmEBKx7F1QFceb9yBydblRNRSOtvcP1X6X7OiVVc
	 /LuPtaS5Zw7hFKzFHeeKlCMnQHJxkwpS9869YJYHZ1PpKJpLj20uGqsnzniJ73mvgGclt
	 EOZOiElvqxSKeqcSSAkXgLyi3qF1A3LHenLL5MhjibDCxgc9C+gCb/0CFKN4XyWfgJAg2
	 jXBoBM13qnScbBtzudQj6Iibf6aLlNJ47Px+/PuYMx6/gEAy4LUeVGSBxax7/bdgjNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dLgq8/0p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CpqfoR36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F16D606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F16D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLgq8/0p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CpqfoR36
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2a0qE597692
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHdDkmm9qQ0sg08pi6fTx+CVVlQ6MmZ0qIxULw4ryr4=; b=dLgq8/0p1TeRQfqz
	aQablB4xWhDlJA86+7ncgunabxiAC77cnwbZBLuOhnjH6wjbpiENw5at63ktFsHM
	n8G0QoAh2QclxoWCxFTmML26ARntleTWTZnZsVSNyla/rQI/ABDZrmlVNjw2vapB
	tfg4HHUSvPLJPWp8aYGf6Duw798plsYL6b3Ca0s4BdrzvCkRHX0E9/45Z8AjGNMp
	NU+3iKJhurCWzNcGDoOjfS0IPCwhgG9mHYrXaM1kxfLXsvtK+ajV+Vrl3dSNeoF1
	RceIwJIZFLdKKhmGJf2T2jCSaDlsn1kHRd9ZvYqyI5GCpvBeiJ6/0HMgj/b63MCf
	yvZQUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153rdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:04:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so74483885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470668; cv=none;
        d=google.com; s=arc-20260327;
        b=kHd5eWpW205GlfTFGsbslIRm2+XXfmvbb1pfxmjLWlcV5qsogqoBru10LoCVBya1yM
         1w4JN77I77XQAw4zwZdWQ40k37jeHLpOfd6nHXtIZQYthCoZ2sLS41xohYQhWPSFkucu
         MqAIvCZ7ItYd1wOGncSzl0yd6lwItGcACT7ZFTMGiiBWqu1M0w7brjsKpCOczBA9PoKA
         TIMyrGNhvXWczmZ458aG8RS0PzRv+MBqROco2yWfSrPn4NO4GevB1vdmltqQMcQrOBj3
         FNXG3comm/TJiUzsySk+d0Rb4QrUUeWWVdnfPPqj75Fv5mGr4G/G8uQO5DAdNc3JQfs3
         DF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FHdDkmm9qQ0sg08pi6fTx+CVVlQ6MmZ0qIxULw4ryr4=;
        fh=XS/4J6MZ7hdrPzTP1DOLvT0UtWpzD+Zdtcz4bw2VHdc=;
        b=qxJ7tzFv0tj9v35sIjK+e9aw3QlLTqhFLhSqxsRZiTt8Qt9BJPUb/tKxhd+y5jdUcf
         h7MZmOI7HenxvH1TGwqcdrLOoAzJSu1+MpT/MCns9Hw5ib5eiMxdMTyyi/4Cdf9iurDM
         39QP+tdXKwI+cKYvn+f28/2qbITOnAvwfqZKhgC8geswXl+FRGCJRtntfp1x9mrQ+pep
         XvvoXU0VD5asrA2//p9LsppZZBLWvF8oVKVZUwkfcCuAigoi6ecnIV73qNt8K8Hszl+c
         aUoUUBYuSD4SylXfJcZiqVkGaa5dBVuLa8Et+W3aGiLvBBXCzywJGKWpbpBv0/s2FAjS
         HMPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470668; x=1795075468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FHdDkmm9qQ0sg08pi6fTx+CVVlQ6MmZ0qIxULw4ryr4=;
        b=CpqfoR36InocL+dXtURO79yYV/G7f4D2RIZY5IWRqNFKT+JMxXlLFvezQUf4RIYMi3
         d5YiR4MYons3bEDzwiUY/E6DqDyOZb21/TYBi870TVpoNVaMekvS5mCX4z9VHGd6V96V
         n8MkrFhCm1GpbgPmCR7L/2u1sZ+1pGNrAOj/AelKZydaA9tPPMcoJAfo4BKWaIqoMyMJ
         Xck5U0wKX0rJ6UJ9maOGp9RN8O5FAJCQZcr5SwTu0kmQSBupCeUwVwxTPNcTj/5fKTWD
         VfB0QC10JTZCHZSg3BGyJTju3dUPTVgo8a3/aJD6167PR68zuNMiLgRbYeYpNqNpLy8g
         G2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470668; x=1795075468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHdDkmm9qQ0sg08pi6fTx+CVVlQ6MmZ0qIxULw4ryr4=;
        b=roMU/50rbC9o7NvRIc8Nhepwk89vknlty1oLFMeFE2D3EUR5gWxC5XETOGC0HzdTY0
         AjAa7fnGjSC5lsZXMCSl8gS6vidOXZaBTWRW4OnqEGXEQ15QpGvFxVzWAA79jbCxkRZn
         J5zGTI9YfYuJsh969iGCp01fey0Ms3xfgn2B0d9JSPh9O0iP3muAhIq8hJTtLuJjvJdj
         ias2m+5sUdQyxMEyVchzgrOtjJKT+u5roU+cYs1yMUZCfmTu73045BN91WPaqE9iazCW
         OoZwnXGvvDNXzLkOOZxxq6gcOjtxth/emXJByZtQkA3uoKkkVKNvzwJwfGJ2BZ/F6Jti
         ip8w==
X-Forwarded-Encrypted: i=1; AL+hErHEdRhEaMTw9pg2JZnTOnceENQv54vl+PdcJ0VT9AEIvuxTorfo6k5AU4ta7pH0ZAmzyAJ4JeVQTnJDqis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EGaaOTAATsMKX61tDL1BBBZdTDghiB8lUTSgZU+BiFRxozXPK
	ZjmNQlYLABvdG7ZnU48HctES9YabL6hJICrROPHKQZOuKXHw5MwcVMLM42VeQvy4OGxpMK65l3Q
	8DO9wzzdW1MQ7eMZEbTXJhBSuBPsbCmuRi6r6IUZXz4mTJpuAMxqEV4xQjg1giQyOBpBkjWYL2M
	rBwGaOg7KB9IC+qbdKR0eN7jHt024RxljeqGwykdzO4w==
X-Gm-Gg: AYBFou1yRmxIDGyR4HLOE7HrNLJoNRxUvDNQaOYGuGMlUkGO85DHNrBimWyKVdamVhZ
	G+YL72RYkatZSruu9UoKU2mmHU9TFc41X5UtCoRBIbZyMTnPPnYShjLFL/+KbRReb9GE3hUD6KS
	kixdRTbH/KwbjpgGoIDSbMulIEugUC7GM+V4gPtcHTeFR5lqcJueb5ZyOOqWMlwaykz4IIomQKk
	1LjtKAAyVOu30dGRrzAbgIfyM+PSTYFECRJrNZb7n1g0UudXZcTO6UFx3CdqKhraur3uWxqWEs=
X-Received: by 2002:a05:620a:44c9:b0:93e:63fd:40a4 with SMTP id af79cd13be357-947affc0f53mr794133285a.55.1794470667791;
        Thu, 12 Nov 2026 00:04:27 -0800 (PST)
X-Received: by 2002:a05:620a:44c9:b0:93e:63fd:40a4 with SMTP id
 af79cd13be357-947affc0f53mr794127085a.55.1794470667208; Thu, 12 Nov 2026
 00:04:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110043006.56681-1-mhun512@gmail.com> <20261111174106.09f639ca@kernel.org>
In-Reply-To: <20261111174106.09f639ca@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:04:15 +0100
X-Gm-Features: AclHuK9VZabyLQbVKXJVYfq63j7iP9JQyT0QdrkFRZjz2E-OQ6UaYfMCOc0aFYE
Message-ID: <CAFEp6-1mdXkaH0gskH6VaW_xRjSPPP3VyfGbNpE1M3kDAbeDaw@mail.gmail.com>
Subject: Re: [PATCH net] net: wwan: mhi_wwan_mbim: disable rx_refill work on removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX3tWKJXPNzfLR
 3DJd3/B9n2NBSj5W6UTbKPdj0tPTgWHmx2axXx9Nea/hios4GCDaNZjY6cO+eMkSEZ/bebKqbZF
 2C5cxrAKbijFWCfM5JNFmQHmXCBpt4A=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af5730c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=9R54UkLUAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=r-nYRLqk3h2YVGBGkBAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: 86qRrfaiKF_ohEsGZhKz72CxiE4d4w2C
X-Proofpoint-ORIG-GUID: 86qRrfaiKF_ohEsGZhKz72CxiE4d4w2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfXyIy+pnIfVu7u
 x03IgxmDL5iylPTEPk5cMIRVSspQ91YBdM+KKpXXmfvtJNcSaenhXl6c/du+5rxt6CWx2iMNVK1
 CT6+1kWfSkh4RPVoxRDMGHfSmlN9xLkkpq6y3VyDPshfThbeEqIGOMOQ/jwTGptA6iWO9945T9x
 41P9LaRabgBnNKKP6MrhGHLHI2G3WqIjYwMUTH9TIlskBcSwByk8sUfEP8d756X7Dcu7jUtbeW/
 EE4FKA38x4K4Rcan3VzKgiyLG3LNzTcD8555fQRlp5fCPNUMg8cv/9PeKHPDUg/eWVAGiXcI54P
 Gq29GwDEshOmJeKpnvf1lP79CNS/5cXykTPrsZJaTReGqu/uo0c29YLhr7pTfikrc2eYIyxM/5q
 vCXZS3xOtH6+0KpN7EHUpJMKMvi7eOCrR9cw89NxYzO/DeMtwPZmdZ9P9zUiBTXDEUg29G6eDI+
 BNmI1bK+Y1Kc2e31t9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

On Thu, Nov 12, 2026 at 2:41=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Nov 2026 23:30:06 -0500 Myeonghun Pak wrote:
> > mhi_mbim_remove() cancels rx_refill before wwan_unregister_ops()
> > removes the links. Bringing a link up in between calls mhi_mbim_ndo_ope=
n()
> > and queues the work again. With the MHI channels already reset, the
> > work cannot refill RX buffers and keeps re-arming itself, eventually
> > running after devres frees the context.
> >
> > Use disable_delayed_work_sync() to drain the work and reject later
> > queueing. Probe initializes fresh work on rebind.
> >
> > Found by a static analysis tool under development.
> >
> > Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
> > Cc: stable@vger.kernel.org # v6.10+
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> >
> > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_ww=
an_mbim.c
> > index 336f89756f10..3b6b0066f673 100644
> > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > @@ -650,7 +650,7 @@ static void mhi_mbim_remove(struct mhi_device *mhi_=
dev)
> >       struct mhi_controller *cntrl =3D mhi_dev->mhi_cntrl;
> >
> >       mhi_unprepare_from_transfer(mhi_dev);
> > -     cancel_delayed_work_sync(&mbim->rx_refill);
> > +     disable_delayed_work_sync(&mbim->rx_refill);
> >       wwan_unregister_ops(&cntrl->mhi_dev->dev);
> >       kfree_skb(mbim->skbagg_head);
> >       dev_set_drvdata(&mhi_dev->dev, NULL);
>
> AI says this is not enough for make the teardown correct:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110043006.56681-=
1-mhun512@gmail.com

Indeed, thank you.

Myeonghun, could you move the disable_delayed_work_sync() call to the
appropriate location, as described in the link above?

Thanks,
Loic
