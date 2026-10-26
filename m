Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033499;
	b=35A4t0BOBKsIaIRXIzxRhJgPknbtioIGLnVZBeVHMQi5kFCPnf7Dk8QNfreIamk9y6xM
	 lUrAZOexz4zZ4zXegos/uBLtVSYmYM+uPBrbzUdnO2b7A4CZP65q1E9cRFZ0gzVM1xthW
	 24gHGXV5LgWtnUEDgKev87/LZPo6dbT++/vceQkdIkjj7StsIvm/4zTe4v9brs+yOQ9ug
	 MTOh18NcEcAaifrDufURwEIVbm5iYMLkNfG57e9Pb5m0WvzVxBfHtS+CEbfWbptrasbel
	 nOdGlKPPZ8wxJmNZ2T4JmKeixzNE00eFmCqKy43X2oD7pyd5fkUrWIfZvCMDjsT67fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
	b=s6eiTCmgbAIFipJzCMbemDNQSg+Ar8dAhyr3HnUilXAs5m1TI6UmX9qmyIt4q0DqplwI
	 S5+N4/T+iTd98mVx9mpGshIQUVmNMQZe62ssZLi+Z0fE3BlbXu5tndYTw3eGHqhwJavZ7
	 eb/RGaBr3aXGM9jpEZ4wCJ1iXbzZRc8vF1NHGAI7Lda4297OcqPT+0BtjFjohafRG77wP
	 K7+L3uhGiq5Ju7cXLEmPt+IMj7a7llvxQuTJq0KOunxHkKSpEVmnRKlwA/GPRbdPh3Hpq
	 AnNmLK4sb/Rf0dm+zzShuIRQ6XjUraV3zOY4mEP7YX0fotOJBNgNinpOicrQghFNUbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EoCgWx2Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMXLnSTX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A38606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A38606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EoCgWx2Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMXLnSTX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwQV42082442
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=; b=EoCgWx2Qo+MPAhRX
	yKavjXnpRQz4TtILPEfZRKugZaBzRUP3AQALpNBmKABPC3PQYaXsEZ6aQhtM3zk2
	GtYdkV5O8ULL58BdofZ3n2d/wT1Phqg5SqbgAKbHMlRMUOWJKxXjmfiYRPNPX2Y5
	Ov7aZtKKyyLC3x5dPfVTbf5xexS71xkjQ9M3VmprPt79sqWElxGelkQmNOHZTNwK
	CFRD7HBjVV/J6AE3rieuj0ptNcWmnpR6DryEKh25NPjvqurk6nh5bKJHOZIiZ9Qr
	Xv0B7sdGbbXpm0F360sMJk/cAIr5+LS7NlOfmYPwG9i7QqPPRldmcZxesM6YfDcQ
	17uJVQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgsuepb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:51:37 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f9b643ae53so2862127b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033496; cv=none;
        d=google.com; s=arc-20260327;
        b=RoJPvsJOzhsBnnGBmjVSZ0Od1sQw1g6mrCzRIPpailDFjugqvk9IhMCyxwxtsnhA4Z
         Y2eElbJleKhvFohZiDYqnNhWrigzfkk2dWfuqDmF4uur+MSBn5VidV6hXVDICkVPBlOV
         SbDCbk16ymVoOAtcEvuMA+foJjel1F+oEZqLLASSvOGRbXm6DO5VXi8WfsUO11a7P9MC
         u0mV9zEABJ5RMGwPSdSp5rYTPJN6DWYsn09lJDK+9tM4iV2OJxJuZQOqruUDmwP+WIgn
         LvtdG87BhLA0dHE3GwTyDsTASvo/bZuTonExEaUJNsexGi5csTkavc7Vi/l1tvVpfGfx
         ZJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
        fh=Uk4QGwZnvFu23CbSaGGuSk8ch88QIrdnGhGGimK03uA=;
        b=heziD3xUhKR+R+e2vFndN9Tc4Pp74g4QngjP1EVWSPsEWkOpjz9YSHRc3Cvu0Cc21k
         m2bqeLk2C2OcGrr4z1L5ovCOMe36CsG9ozdRyLIDxli1l6DiQwfLTEK4jHonyG3Ul08+
         88Sa9pfmJ3ezbep6IbkKqsMSnJoYIhC5LECX2jDGHbTS5Pq49C25fjmLhXC+5dQCumMb
         TeQzQ8MGG5ILIAwnaHrsCuh+1y47+h3pCrGcNl9QaLSVyChcC5j9qUXD5UJBJN98lQ0+
         +XSYa2D5v4yE6xe+ScN0GTkjzHfxaUyRo3TuCH/pLpPfSUkakvswhuNm3I/btheXxzXI
         LjFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793033496; x=1793638296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
        b=OMXLnSTXKHb4Xe3/F6uBn+o3vrG8xzdzM9J3ga+1Nl/DFaknabwuHhfk6kpPByb1f/
         JDM8OjA0xAXqzr0aMH6KAWdkftyJY/Ac77pQjBXKysB5aAoovaeUEoh4YIDgRSeXCCfq
         upqLO2ht1/1pOq8gvdUInKa9yGcfpA7TXED1uE3jT4AJ8IMx+fBHU/dsRoW2BZr/Ks9P
         Yb8VmA2P4SufTRDC8ku6I7wOl6AX/d7H4IxxqlKjyB4hf5l/sK3p4hps4j7WMG+uz1Yd
         Uvhe/V9+yJCTWjOgxI0SYIvBXizI4WAlNAET9H6e/Fwk35b9OvpqxtFppZm1LBzNBRuk
         wYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033496; x=1793638296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSu8bIwllQ/UcPEMwqmNzIwVAcXZ6n+a4SKSGu5Wnys=;
        b=qJE5C0eAsOedy0X6snpGlo3b2zrYMoiAqa8eJc29LZJxWw/gAnwh1xgybq6ooa4lz0
         C0Tz2DOxeI+Ovs8NU8gbf9NHgskxS4oBUciYO+hE5vgowtA98cpbwdUlup4nW699/FJQ
         BgeSdfv1iSfnaEDAfpKoQufD0IUZX77yg4OHYLb/HD1PREV0s3XNIm5uEUcJksVAUdmH
         mo0ZkAT4yDVP4M4HMlqi+yQTL+MzSUMt/PbTrBsmd0F2HzVb46Ws8ydP/jojKZGUbf0c
         sJLiiuYfBR78RRj/YerFmLDWWYZym6+Ch8VwUODv/GYCnzn2wCOf4s4l8dkfiXnWTtrp
         /iXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUdzmXoEYWB10Obf+5RkElG6m5CzozcpUXJjvlRSkF3sRIvYWcN0l8o+SQjbny8EFGskCPyrhyfmIIowo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkZQsxWkq6Iyo0iHIVe5+gLVC0zf8WHa9lwlb3kBKS5tyyXqx7
	C6h+LmhBqNt0OBxkIxeyL1g3EimugIe3JFvvY2mc3KlVaRcEt3q9hNUML7YsTptDZqExp2xfSRl
	s2/2xmOL2aERKWxfVzWtasFR+UXjok5JqeNrw+oXN1uKqeMvCAV7Kw1HQEhMDMvRZPgk3leLiRz
	ELPmeU5wYS0LpHr7Fsc7fvsAza1iSor0V3inq5UOfZRw==
X-Gm-Gg: AYBFou3w455Xam8RXuY11jShFYzADlabaYctt+Al7dE9kpd6SUjRTBQ/AXjNlYyTpBl
	4je+p8FINwH0eqIMU1p/F+yTA3s7R9LEHN2f8EDlquV8nqchgPqPD3CL2Fzb3eKGxguO951J/fi
	PcfzsT2ZNpWpeH1m+sUj6WT1ffCIEAl6SCpplNvcJhEwZJM/PbLBMdAvCUOq8KX2VPoRonshmna
	B9zQKWRhJ+RNaUw713F+kWUu8rbayzX5sgQwQgAB9MeQ9jKVIh91OFSkvoAZ8N8G3/v5g9kV0Bz
X-Received: by 2002:a05:6808:30a8:b0:4d6:9293:9bc3 with SMTP id 5614622812f47-55c0035e0d8mr4594263b6e.61.1793033496466;
        Mon, 26 Oct 2026 09:51:36 -0700 (PDT)
X-Received: by 2002:a05:6808:30a8:b0:4d6:9293:9bc3 with SMTP id
 5614622812f47-55c0035e0d8mr4594249b6e.61.1793033495896; Mon, 26 Oct 2026
 09:51:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-ath10k-temperature-v1-1-e5cd6fde7f1e@gmail.com>
In-Reply-To: <20261026-ath10k-temperature-v1-1-e5cd6fde7f1e@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:51:24 +0100
X-Gm-Features: AclHuK_Jmeq84Mm4fd65kQjsPYcOJSPjKDNZR_s6Js0HaIcEN6qdLR_UOiC3E4A
Message-ID: <CAFEp6-0LiHBGz+yZb4+fExSFR3U=pgKbCui6ZdTxVc39VjHbQw@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Stop unanswered temperature reads
To: effeffe99@gmail.com
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX5k/J5IuHSepZ
 tGV2m3dnXyHFbNM9GM1WFr0kDPv5sOuXgzZsSo1tspXrXQgfTv/Ng3lvNwgO8/BNLUOhMITMRqD
 vkTVxtd6v5pVAj1jU7p/qbYrBr1os1E=
X-Proofpoint-GUID: ylTElkSjza3_UkPYgrzw_GuiZxFJZ16U
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf8519 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=pn2aKBgt1YT2jw1FRdIA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: ylTElkSjza3_UkPYgrzw_GuiZxFJZ16U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NyBTYWx0ZWRfX+A1Z4JV/unhd
 M58z2s6Dd28Noz/WGo+r/kNBHH9Jd0hi6qlP1oNGuupMNmkAvEtk+5Tm/8RYHlbOZJ9E6MLd6qT
 d4zqvxP9Fn63hi0GesMVFZ8/OdVEMHCX9KVwpdiGD30KdN+/ziG6Fx4u6++Hs83W1XOPABwhYi1
 SU41nZeo4JlWaidweeDP0sVErcawh3ZFPV85DAWX4Ne+Hpeez6liWrd2TYjNctbw19KBxqIQchs
 pWPdrG9QCIVvVIeuHsUAq8H527iQhkbZLSMXj5VJRYnEAN2eIy4qvFtseqtUr+g1y86iPbFsY9U
 7RZPoVQGgsK0YNsxR5vB2WtuxeroQTmEGla1l+pEVrt7sKkFE7a7WLTYivwZy5laWEekaGgfeEV
 9fQhSg3R9Ua8UzUZBGj5tE8UEGfotKCprhnnnDbHSNKlEB8eCezyXbH67hWBIiYnaAzWN4Cu1/r
 qTnzQE4Gtw680NJhbQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260067

On Mon, Oct 26, 2026 at 5:36=E2=80=AFPM Filippo Falezza via B4 Relay
<devnull+effeffe99.gmail.com@kernel.org> wrote:
>
> From: Filippo Falezza <effeffe99@gmail.com>
>
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
>
>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>
> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> lm-sensors, hang for 5 s on every run, and configuration changes of the
> interface wait for conf_mutex in the meantime.
>
> Whether the firmware answers cannot be told from the chip: firmware that
> answers and firmware that does not both advertise
> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> Instead, remember that the running firmware did not answer, and return
> -EOPNOTSUPP right away on later reads. Forget it when the firmware
> starts, so that a restarted or updated firmware is asked again.
>
> The first read after each firmware start still takes 5 s when the
> firmware does not answer. Reads on firmware that answers are unchanged.
>
> This change was written with the help of an AI coding assistant; see
> the notes below.
>
> Fixes: e98199a8c27f ("ath10k: enable QCA6174/QCA9377 to read the chip tem=
perature")
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---
> Notes, not for the changelog:
>
> - Tool: Claude Opus 5.5 in Claude Code wrote the code and this changelog
>   during an interactive bring-up session for the Moto G 5G Plus. The
>   request was to fix `sensors` hanging on every run because of ath10k.
>   A first version disabled the read for all WCN3990 through a hw_params
>   flag; it was replaced by this one so that it does not assume all
>   WCN3990 firmware behaves the same, as Loic Poulain asked of another
>   WCN3990 firmware workaround ("ath10k: WCN3990 firmware workarounds for
>   WLAN.HL.3.2", March 2026).
> - Tested on: Moto G 5G Plus (SM7250, WCN3990, firmware
>   WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1), linux-next next-20261021 plus
>   device support patches, with this patch in place of a local WCN3990
>   quirk. First read of temp1_input: 5065 ms, -ETIMEDOUT, one warning;
>   next reads: 8 ms, -EOPNOTSUPP; a full `sensors` run: 25 ms (5 s or
>   more before). After switching Wi-Fi off and on, which restarts the
>   firmware session, the first read waits 5 s again, then -EOPNOTSUPP.
> - Not tested: firmware that does answer the request (QCA6174, QCA9377,
>   other WCN3990 firmware); for them only reads after a timeout change.
>   Not run: sparse.
> - Build: W=3D1 for arm64, no warnings; checkpatch --strict clean.
>   Applies to ath-next (cd026e68f).
> ---
>  drivers/net/wireless/ath/ath10k/core.c    | 1 +
>  drivers/net/wireless/ath/ath10k/thermal.c | 9 ++++++++-
>  drivers/net/wireless/ath/ath10k/thermal.h | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..9467e4c3099a 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2985,6 +2985,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10=
k_firmware_mode mode,
>         clear_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
>         ar->running_fw =3D fw;
> +       ar->thermal.temperature_unanswered =3D false;
>
>         if (!test_bit(ATH10K_FW_FEATURE_NON_BMI,
>                       ar->running_fw->fw_file.fw_features)) {
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wire=
less/ath/ath10k/thermal.c
> index 9bb486f8e920..1079d552cff4 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.c
> +++ b/drivers/net/wireless/ath/ath10k/thermal.c
> @@ -75,6 +75,12 @@ static ssize_t ath10k_thermal_show_temp(struct device =
*dev,
>                 goto out;
>         }
>
> +       /* Don't stall every read on firmware that never answers */
> +       if (ar->thermal.temperature_unanswered) {
> +               ret =3D -EOPNOTSUPP;
> +               goto out;
> +       }
> +
>         reinit_completion(&ar->thermal.wmi_sync);
>         ret =3D ath10k_wmi_pdev_get_temperature(ar);
>         if (ret) {
> @@ -90,7 +96,8 @@ static ssize_t ath10k_thermal_show_temp(struct device *=
dev,
>         time_left =3D wait_for_completion_timeout(&ar->thermal.wmi_sync,
>                                                 ATH10K_THERMAL_SYNC_TIMEO=
UT_HZ);
>         if (!time_left) {
> -               ath10k_warn(ar, "failed to synchronize thermal read\n");
> +               ath10k_warn(ar, "failed to synchronize thermal read, not =
asking again until the firmware restarts\n");
> +               ar->thermal.temperature_unanswered =3D true;
>                 ret =3D -ETIMEDOUT;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wire=
less/ath/ath10k/thermal.h
> index 1f4de9fbf2b3..cb930da5c04a 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.h
> +++ b/drivers/net/wireless/ath/ath10k/thermal.h
> @@ -19,6 +19,8 @@ struct ath10k_thermal {
>         /* protected by conf_mutex */
>         u32 throttle_state;
>         u32 quiet_period;
> +       /* the running firmware did not answer a temperature request */
> +       bool temperature_unanswered;

Maybe just "bool broken;" or alternatively a new
ATH10K_FLAG_TEMP_BROKEN dev_flag.

>         /* temperature value in Celsius degree
>          * protected by data_lock
>          */
>
> ---
> base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
> change-id: 20261022-ath10k-temperature-22b119fd615c
>
> Best regards,
> --
> Filippo Falezza <effeffe99@gmail.com>
>
>
>
