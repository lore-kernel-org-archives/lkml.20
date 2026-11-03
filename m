Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793697654;
	b=DjmERUDC455XO8mKCfmB7cqC9yPg6xPsZRPYVxEtPR63SkcYs6RnETRCaRgsXFpHCIdm
	 7Pd96XsgPTc1RAidvNoUJLb7g1Q0PHWkUAH1xXRyDDxyna6ldv7bkmlqoDjH4NPH0K8zH
	 7vkdTXgw4rxktjav4vdCpUcRQe/ULY52Cnrvx+CyhK6pCrhwTz729Z92QLyeOEMdLh/b0
	 Je3/DZCBH1Vp2LkzjSlSGecClsBqTeAWfZLtR4+SK6cTL4VUfklbnj/3oMJT6K0QS+QS6
	 bhYwsrUmvIcv1k/YQZQBim8PsyIY5u1K9LV90B1fcMry1par7HWev9EU07xLN5lN3Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
	b=AAvpuCVlvmArvroSkpo6RvxQBy+35F58sMjbgX7GUsyCICRL7Wxj7Al8Qm0YyPireeJu
	 2WBCih+gHsb50caq4svvPZ93UGFLJN1R/NXnrPi22MCX7b7FbH2XnYrBpnhuYO+O8CG3I
	 gLyStfExzX3ociYWps5ggKghDEHsAfq4jVGRITOqpST5xzEs6A5vpAYBSzrO8zTWv6F2u
	 vxN6sKoYPJmzawwshQapmQUBCTDnWjnZdGs6F6vtkx1DWVKw7f/KhLle1tNV6TE2s6KF6
	 AiYFiUE8Gk2I75Ok87EhFdb93UJU8Xva5kOSJKpupWATG8cWeBUlczpaD4Pes3WagiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jR4khUt7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Tg9IKvD/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E34606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E34606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jR4khUt7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tg9IKvD/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37ntoC2403198
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=; b=jR4khUt7auVF2cTs
	+zE1das89MxlX4ly8zfcOrManLqiiQhL486a7PFc00bj1PPUpwccm31TQKNOoyHI
	AVAUs/O4hZ11F31TXS6ZRbJE8KN8pFS51HYtVDbtdJfaqI3Kx08A/17DodSlik5w
	vDpRIYy8JZNVfd++OdET2A0fnw7JxO9zAqlcntMsTT5N0ME5LkwebEcl4BmebNdg
	QDKiWkfzy5XMLuzZaz99k5Aqngvrm1nQBnwiVZsHHpx26CMr77kFgGp0Sz5PAQF3
	8g+YTwsflDwMKT79yPcRN6H9JEdVhcKtZCfPvRQ3BLu4A0Yq8TiuMIELtxMSL6Hs
	WFm76Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy24gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:20:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f568dee56so331980985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697652; cv=none;
        d=google.com; s=arc-20260327;
        b=OsC6BMhARCGeuIzVE6VAAfEdFCh7AaH5St19ZC7CN/lz79Ud8qN2NdctJoM371xUSE
         5Zyw2vPt7n8T9woFrbDnagSsnHPk0NL525Cx59iRj1E1z9bFo3CWjaa5aJb9eZ10vwwl
         PdLEtvx4shvSu41dyxOE36QkPfniQyDCIn25zHqRb2zWMivnyxSFbwBqC0y98GPPYgBx
         o4zwobBkHet3bfq6+l4FdvNuCDqM6vgVVlB81ZKB61wRC24OI8SkGdDKuM0gq1tVUL00
         Knw5WnZbwvF2A8jl0fLYrIakMx29ICB1dpDWVXXpGI2VdPcwxGcK3gDid+nzV90BSkJj
         6ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
        fh=wEJ0zPIXsflh3Me2jWEJK48xhpOy3bCqLoAxic7q+4M=;
        b=M9rCk0inCc3g7SHydupn9NUh0MUGycsftPIVnPeJzkuRgnZpkgtviNgnxnWkBPHmS9
         K15RcmlzwY6l0OMkPszDiTOk+Yq44F2gc44DnHQjB9pWmz+Augmje4dhm01ZbUkbOojv
         KJz5ATLbrjivR+i+I/LqNULHOAqqHpaJ08H8kZ4eP/5gbUVJx5YbKLSvulk021j3vpxR
         ChWnA95Z+3PQF/yE50UiOvxPvscVFRDAmLVOjRUDBq2xBs8X6bNM4HLA3A5wTxo70Flm
         7iEeGLf2Awf2nc13fyPJOmCh8ueKENkxw1Eortg5yzGQj5n+2j7RhoQluZJ2u8w5Y8YR
         0i6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793697652; x=1794302452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
        b=Tg9IKvD/Hy/byn9eQO4Xf7uRMQ08K2y+9cn+A1H/SYfAyUPpnWpQfU2mCAtiM9GIRE
         KJxpLQnqSXGWt5C0vXZcVzA52ZuPyVVtN4bOqqXkDaVIEnUo1/CkgJtCz+EccggT5bHG
         9CwIu3G7cCdLEXhoOn7VQIM1RDRRU3XR5VTSljyUKPFrOJuWF+PDHw1pmpOonj6IK4x+
         xpqVBcw8n+SGOHHGRfS+0+o4U9Js93gm/5ZTIgx2fDVqGVD+xbjaeYGovkOP/LBrpMIB
         oa9w8ny4CIHw7E652l6bmIjzq2EM8ByYPMLgKpTYSQ5cXzfStcbxHOq/dg04V+w4sNl9
         swpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697652; x=1794302452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUBbiIfZu+24bweR1re7NXjlbwlpg2p+g1Gnk+3cVK0=;
        b=IhJTholC793ldhFncopw+jNSr1uetbVEDu68qLUdmCkPApjJGBDEji8veXanehSakB
         WdTDVduWwYIOjv8Rw79Zabi/neLVLKbP74m8gCl6Tq4ksYNis3zWwqTAyNYcSE689iM9
         78NK8iMe9lhwrwG/JiSQFrMwnks88nE+yeEYIs49vcbHIGwRn4uCHcWGq3aIMPzu3wzl
         GA+iDdLpDjAncDt7ZBRfcfud2lwD36GUz2QT9T2+MFdKC4rK6KptY1t0X3yLQ7opqSK+
         q6N7IWuaZ7Gx0Z09bPCZzDSpQltroGkMdnl0q6nK0cqUClBBZnDArVUPCCNbMmadmN4z
         17+g==
X-Forwarded-Encrypted: i=1; AKwUvByurj7AHdKJfTOFiJcV6zxcI8kPsvM7HFGkWVLWz8Z/f5B50Kazs7XlbPe0RBjmufktL2t0nq9ZqKlfSAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rv/DgeYnJl2IH0DRdUQneB3Ok/2u+92v8SizHOJt9mTVzM4CJ
	Pq8ruzgRgIpkw9NO/XGJ3jA/IHrcp9E11VfeyEvEjD5Uag2BdjzAj4l3OThiSAzusV7pTqh10cM
	VT+yBGManmXD6wmh4jS90too7pVizJUmAwOSaaKvge/DoGWc1MTKlq8DdT/vt5duUGG5BJIzePR
	ELh9kAmtX/cu3tmdRBPKiZUppBbYXEGv7UEWXkHM1u1g==
X-Gm-Gg: AYBFou0jTMeSESXwQ18rMdQX5vLOlVPcdvaT6DurgCXzLoNBBNovFs4Ou2I1J6rPtiK
	bViX6m8RmsnmRzoD3ndJUHWszLP1+hp+52ePmQwMd8UX0aITb/6z52p6yhjZgwD6iNqW651O6fi
	0G4AzSWHLwkU/yWfvk72BDOSuczjbRLGD0RP9QK1QiA42lslaM1Q+BSTiCSAuR+zM6eYFDNkyIB
	A2M0EiItNbeO0XJYOTaZgZcxWTg152m2acs9oUeMODaOc98RWcqSI3UqhhhfluUhbpwbowcj3A=
X-Received: by 2002:a05:620a:2b44:b0:93e:bcbf:4ad with SMTP id af79cd13be357-944216855c9mr2096034885a.33.1793697652216;
        Tue, 03 Nov 2026 01:20:52 -0800 (PST)
X-Received: by 2002:a05:620a:2b44:b0:93e:bcbf:4ad with SMTP id
 af79cd13be357-944216855c9mr2096030885a.33.1793697651561; Tue, 03 Nov 2026
 01:20:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com> <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com>
In-Reply-To: <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:20:40 +0100
X-Gm-Features: AclHuK9oFUU-GohF-bJ9l6vtg0lo68CrWTs2ZXBEs1Vyyp-LhH1J9qLG4HKSIt8
Message-ID: <CAFEp6-36Fc15uDWSR=v+xCMhERbkhggZOBoEFTF7pAcRLz_vFw@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: "Conn O'Griofa" <connogriofa@gmail.com>
Cc: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>,
        Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: W2wEhBUJ-K8bSrIIguNT9ga5wj88gTJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfX1Bxmj03TCbRM
 glu4Rji63aloxKNUt9naxIGSPkQ00ctMLN0AawofDTBFdquZSfSj/MZ9NoIzNovJR4tsy477PrK
 QaGSUHFKjv5DPDmDmk2rq4yh6/YOTZnueXOEot3KKbuVfT09LPie3ySTpUQ/qODHnkfLS52EkPR
 VjfiCwgDxBdd6gbRxFnlCNEmkqdDNzezPuXiaJopWfTZaUDFsLgjcF2vu6VVOgm4VDXJNCM3pCx
 aOx3qsdNE+GEpg53QudOY98FxcTspaJsADVF31IHn+bJ8w2H67SDdFuCjVAwC7gyroGt8H4d1+P
 j83yyo0NrMYmcbRVmhCBDDB00aPuv4DAlqjbmWCzjoNWgtHUiF5mxVRBqZcLh/KjWLyAiftfDsa
 DR3rC99ou/fOp34zY6hsSvIoAym6vHHxMCzXvvNMkQEKaylSAGOlxeg8iXX6LM2og20R8uYy34D
 uLRJG7YxIVvOZaLaAcQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9a775 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=3iNpH_K7wzUH7o6TWwkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: W2wEhBUJ-K8bSrIIguNT9ga5wj88gTJg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNyBTYWx0ZWRfXyONcq9na0nbm
 574cQNFw7nehmh9l5AtXkYIVkAGIZ/5lguAYHQyzL9aTLhvDMEP+/at1/ZE7oPj+G9zTA5KQYLy
 c1OilEmgs1dgKWv41zsGMaujpZyhzOY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030037

Hi Conn, Shunsuke,

On Tue, Nov 3, 2026 at 12:57=E2=80=AFAM Conn O'Griofa <connogriofa@gmail.co=
m> wrote:
>
> On 02/11/2026 22:51, Nagashima, Shunsuke wrote:
>
> > Aleksei, Conn: a firmware file update only helps devices that load that
> > file. If you have time, could you make the same change to the
> > firmware-N.bin your device loads, test it, and send it to
> > linux-firmware?
>
>
> I can confirm that the unmodified driver with a patched firmware fixes
> the issue on QCA9377 as well. I appended the mfp-support flag to the
> existing flags for both firmware variants that are relevant to my device:
>
> ./ath10k-fwencoder --modify --features=3Dignore-otp-result,mfp-support
> firmware-5.bin
> ./ath10k-fwencoder --modify
> --features=3Dwowlan,ignore-otp-result,mfp-support firmware-6.bin
>
> Testing each firmware individually confirms the flag is now present, and
> both firmware versions can now reach 300Mbps.
>
> ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5 api
> 5 features ignore-otp,mfpcrc32 18db2397
> ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6
> features wowlan,ignore-otp,mfpcrc32 02bceae2
>
> I would be happy to submit the modified firmware, but I am skeptical
> that it would be accepted? I'm not sure if I've ever observed
> unofficial/modified wifi firmware to ever have been accepted into
> linux-firmware (which seems completely understandable, given the risks).

I think having this defined directly in firmware-5.bin makes more
sense, as the feature is primarily tied to a specific firmware
implementation rather than the driver itself. If PMF support was
introduced at some point in the WCN3990 firmware distributed through
linux-firmware, then advertising that capability through the
corresponding firmware-5.bin entry seems like the right place to do
it.

Compared to enabling it unconditionally in the driver, this also
prevents older firmware packages that may not implement the feature
from being incorrectly treated as PMF-capable. In other words, the PMF
capability should follow the firmware version, not the driver. As a
result, hardware using the same firmware image would naturally expose
the same PMF capability, while older firmware revisions would continue
to behave correctly without requiring any special handling in the
driver.

For change request I think the best for this is probably to follow
board like change:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfil=
es.html

Please, keep me in CC.

Regards,
Loic
