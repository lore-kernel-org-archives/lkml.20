Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793090596;
	b=MFFuOjxUYmjxoudKah8e4YmX6t55VfQ8+h3wyEdVf9LeNF+RMcdGDnIsDhT/fNeCBObW
	 jCdbbwGuHv6qfJomIKUN41QEFYHEsTQ5ngJup+xVC4ddWjZUNUX4ourKrazCXSNibkruD
	 I8E1DS0WT/r5Ew9ReAQma65fFQk8gl9K4sElZalfw2gkTLZOxgAgRZiy+PqhlcmKdm7jm
	 YeiWjXuJAMdeXVboy49jqkaUc5vuU9M47CyF2wbHKvUN4igrIRoneSFoV6VrHjR1LUA+J
	 2XFoijK3io2JxmyFFY82z++vsMEpTNu5xywhBWL1Md42LXIfsw9OE+w0A2zmNmxD1ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
	b=G/Th3ZnSgMfSmdag88hpSVH/h1SmhBU5jP0vKDbXWvlzGdmnzMd6OY4xobZDppsVTkoI
	 Gve4MA0EAhyDz82CMxDU3+C/nWOicdjCJW+9o6zJwC2ta0DMvmvOgsueYSiTigUJnlzv5
	 +Zk1dE6hF0Wd4pDByptS6ATihBv2BTp7loL9V8h/CqAXdqyDf3r/twIxJiqDk3lHgAxCP
	 02rqKmB/XmFxjpR2pJQG23VHmfsTNy7VteK3jz13sJixPF4QuWzu4abaCDfeUxjG9vxnd
	 ooDMGBUu+HDF3gersfasF95aghlFmJQS/M8eHp6vLh1hMsre7fNkEoV9c/f1V4Udnag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyfYhr3s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILJuOFTa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC08606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC08606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyfYhr3s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILJuOFTa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fmdv1350041
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=; b=hyfYhr3sB5rRyhN+
	23nEsrpt8HS0WRGRdV7i0iqxj0rBxhoY3LIJLxjzwhs5+gJUbN8YXXMLXHHYbkOo
	ouOYOL/iY8yGW9plgrCovP4NistIzyu4JJj91NxJ1W/EjLmnjAGtpA5pHYZr8+91
	W2mW0wj+DMTgPcM0go70BtRp5v4vR1J81RWtwaHADYRSfeXLjwJ91FZRGKZuhJCZ
	uffr8h5MpH9E6mCjTu/OUjd0DDKDQWradsRhEHy63q3LGMhrSHVxZa/f3dhcdLP5
	ps3RCMQJtzwX5rZNbrGBqaMAkviEzO0RVFoJH7LbKmFh1NvkOdT0vNqk2l0oBbyE
	nZ0CDw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5r9s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:43:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91becce058aso105940986d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793090594; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3+4sGckRqLNKqlUSjlQGX6EKenCIyhIU7QCTE4nK2c5gjJKrxg2ajgvianBBpcSZ5
         NUrpg35pAa4OzTLpE5NekCu2t2ilqB8M861ePjkBr5jLa9bG/32co81dqmCFRugKo6WK
         g6OWdiE8nJyRvbFGJnP4EY/u1LT2sFFlxrL5wYclW6MvUrvDBAGN2EsGa5+f3qE1HICv
         kjv7wadOKuvX8Os67gQNs7o44y++K24Plo9zx7MHPTzlsqP/jEaAWqUD8a/swkdNB3HC
         dKe/rPd0kaJLCNyKD8U35E19Zsvre296kVxt5fymwZMDPok3pNPkjEAh5CshyAQu1oZt
         D0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
        fh=b8eS8MhHo8uLnXdu6vnN7JPqhGvYK4ZXs1Ct9XdJcwQ=;
        b=HjzJw9QqmXQaYBiFfT0xtZCQn4rBaB6n17jq7pcbck4dttN5rn3NJWQJbLci/8QXVN
         QyfoctfZ7Zv1TARiTREHLV4sSdhOrHamLVWPtL1k9+TkQejh53pqQStdNpJ9mCwDyorh
         AsZVDi5Oqpznw10ZEwjvavLug6HmwHid6SdWHeJ8v3EbbSKHJ5yI54D6rZESpi1cs0zL
         btZz55Piq3XXVoeweVX0eh/mwMG7S+JuZpGJGODVcw1Eqvua+pzZohF3s23h2R72fxrp
         XO3edZfF2ArdklcfpLSwF0HEsxDcPe4gTp4IZgWuIynsRpWxjWJNn5YtWoSwl+SZ19eR
         G0WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090594; x=1793695394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
        b=ILJuOFTayjq5R2rXMCfcoMe49tp7zQbnJyY0XZuJUyKp2lQ3r/uZgM+Qt75m5nxDYB
         S+PVA/UMC7QiAU6OD7o78JF31zFsTK9N01hTWvwR/DsY+G98uoFSW9Q7kWWgOiKdKlwz
         iDCLtRu4E/BHAzQmHaUMKrqEYCPQNduU25fGc9JG/9se29JAnjMUTnEED4ea6UNn1Hve
         LInuRFjGQ+Sb4EHw7NxnUd/XseexLX0Qn3qXA3qvHhmTvIUeqrzAtvY0e3OuHN0ibdLv
         QhK1R8rfkvHa+qQllcQrTngJkRDNLMQGXuOzf1ZbVKchl7Dhaz0tdmarvcmdCnt8ElzZ
         AT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090594; x=1793695394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXBwzkS199L7NkdUYAGclEKe9jKh2QWMzyu5AbccAZ4=;
        b=fh4UZqpt6gGGmkZJDq9ib+iCo7UkT7WpG+gaEimGum5nxHQuW66rHuBroHO8cv8Pxc
         1OpqUfAgKLlBsweg1645CAPQf7mzBWuaLCRKq09DGuBd26jD8NytWFP12tqiDZ+m97QP
         5nQIojgMapjXBjx7kUWCJ0IFwabaWpk42krixoga1PTUnKIeJViKCMS72xe+b6sjjGNY
         pxdp0Iblc7UYCoMayTsW46Mjc9iDZaY4JaC3iyMivBFyH1ZSmo86R3idWLalzP3V3Smq
         8oLOr3k7qHDp7r59iMs0hELF1AzaCMVoWlsTgZDaxr+SicIveNtpsv70RrGFOD7uNsyl
         0vHQ==
X-Forwarded-Encrypted: i=1; AKwUvByELvO3KWLhyfHST43yzeVmq+hYkh2XX1sulqfnI3iu+bJn2Oluz7xtL+wuvPim1XYIlT0sIeIkBu+lh6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxhAKDSBwS5oz6Ijbcg2IqmLd+rLI/3tz7bN5lHsXDa6uxyGe1
	yoVeQkpU3V0sthdAENPSXb60KVyirCuvZufwive7QVMnTYDE6lEkKwiOnIYOS5gfoznxIVjRc7D
	woXLzx1CmpwOwUMXzv0cYAv27hoY7/+w7gCuFwMASell3rha1LS5PDy5sqR/rCmR2bhDBGPjzFA
	tJWgI512HGdU584+Ffkx3olYpuSd0qbLdcxcKmpEf/3Q==
X-Gm-Gg: AYBFou1l8dm/g2GfwNf836Qm3xY/UzWg5eWltW6WGhbZumPhFJMCSOIsQFi2FZbGkEg
	5ZyxcLgctm1Ms+yAzVba0xwf65R8NaTwTghS8ko2CU9Em8wexF4GUahX/2yJlOhylRIgCi87pMb
	vd9fgDPPiDwJfYcOGaD8lVnr6zSBCVnt2JWes/5W/slHL89OhnXh2CzsMD3tmUol7sOskx2zZHc
	1UtmeJ8NbSr5TUqYHdSjuBreBSxE1ZCNbeBbLJzbFOSGVaBAC+fP3sMW39hGcTSzp7MD/KE1DHH
X-Received: by 2002:a05:620a:6605:b0:93b:d7ed:ff3d with SMTP id af79cd13be357-940ef98797amr1274816085a.63.1793090593922;
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6605:b0:93b:d7ed:ff3d with SMTP id
 af79cd13be357-940ef98797amr1274814285a.63.1793090593496; Tue, 27 Oct 2026
 01:43:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:43:02 +0100
X-Gm-Features: AclHuK_5pFygU_jzn-hqcPuz9wQNMws9wc2uom00ym03C3O7qRCxHLEYDup8Xvk
Message-ID: <CAFEp6-0UXd_YLG77tM9k=wtZ6Q5f0Q0wOr5jrkMM3nPe=Ky7-g@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Filippo Falezza <effeffe99@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX/MwNFmJ25K7U
 SFu6bIXCVamKmUL2T9HcOwDi05zqhFgrqgxZScPo8PKnW1OFKlyLt0icXkwffbbYevfeny04vjt
 HuNKKuPiJPXNfMLoccEhITlfCk5z8KM=
X-Proofpoint-ORIG-GUID: xOz74-W2g6jSFrNoqmttrxcWjqvJ6aum
X-Proofpoint-GUID: xOz74-W2g6jSFrNoqmttrxcWjqvJ6aum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX/c+mDRypqouf
 nvZdYTnoyTlr1Fig/06qDb238tZixxWuCvBqIYT3O4+JLPaqrAzQGuZDWh5SHazeLcGkHd7DzxY
 YqAoWmEQUna4/z9/0Pje/tFKdGlnY9DuJ1/Ljzzm+nCUIw6hkmo4XSGJldlJRRnjQPC7w1Xas5k
 Mwyc0wSZjosGOaj+MUM9BUCGJTcNKDKqkwLpf85KDofbeUBEDuS40LsZM9ZmKQXoToK79oGgQcb
 5FKjheY3We41kWNiJljVLePUd1RTvLD80fEQnntkTLmDdQUnxJy8YRAEY1R/Db48oBWL+sRc0jf
 i8S3i1fgkGgXyMaMIElXZu60n3le7LdZA0/VYNouddSP6nbfqvUwZkUE6vxh29K6CQZhE2o1ISc
 05xGfhzPq+3Rj9zc6AFdZdbAQrGvI5zjNXjdMCcJaT1Y8hYXnPDKKTcgqlZjcYLb89cPcuf1Yfl
 tLNnR1yE1OM919Gl/SQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae06422 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=pn2aKBgt1YT2jw1FRdIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

On Tue, Oct 27, 2026 at 2:56=E2=80=AFAM Filippo Falezza <effeffe99@gmail.co=
m> wrote:
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

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Hello there,
>
> this is v2 of the fix for ath10k temperature reads that stall for 5 s
> on firmware that never answers the request, as on the WCN3990 firmware
> of a Motorola Moto G 5G Plus (SM7250).
>
> The only change from v1 is the name of the flag: it is now
> ath10k_thermal.broken, as Loic suggested, instead of
> temperature_unanswered. The behaviour is the same, so the testing from
> v1 still applies: on the phone, the first read after the firmware
> starts times out once after 5 s, every later read returns -EOPNOTSUPP
> within milliseconds, and a full `sensors` run takes 25 ms instead of
> 5 s or more. Restarting Wi-Fi makes the driver ask the firmware again.
> I have not tested firmware that answers the request.
>
> v2 builds with W=3D1 for arm64 and is checkpatch --strict clean, on top
> of ath-next (cd026e68fdbf).
>
> As with v1, I wrote this with the help of an AI coding assistant
> (Claude Code); the testing is on the phone.
>
> Thanks,
> Filippo
> ---
> Changes in v2:
> - Rename temperature_unanswered to broken, as suggested by Loic Poulain.
> - Link to v1: https://patch.msgid.link/20261026-ath10k-temperature-v1-1-e=
5cd6fde7f1e@gmail.com
> ---
>  drivers/net/wireless/ath/ath10k/core.c    | 1 +
>  drivers/net/wireless/ath/ath10k/thermal.c | 9 ++++++++-
>  drivers/net/wireless/ath/ath10k/thermal.h | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireles=
s/ath/ath10k/core.c
> index 7c2939cbde5f..a749ae582b0a 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2985,6 +2985,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10=
k_firmware_mode mode,
>         clear_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>
>         ar->running_fw =3D fw;
> +       ar->thermal.broken =3D false;
>
>         if (!test_bit(ATH10K_FW_FEATURE_NON_BMI,
>                       ar->running_fw->fw_file.fw_features)) {
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wire=
less/ath/ath10k/thermal.c
> index 9bb486f8e920..9ff7de0abd12 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.c
> +++ b/drivers/net/wireless/ath/ath10k/thermal.c
> @@ -75,6 +75,12 @@ static ssize_t ath10k_thermal_show_temp(struct device =
*dev,
>                 goto out;
>         }
>
> +       /* Don't stall every read on firmware that never answers */
> +       if (ar->thermal.broken) {
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
> +               ar->thermal.broken =3D true;
>                 ret =3D -ETIMEDOUT;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wire=
less/ath/ath10k/thermal.h
> index 1f4de9fbf2b3..d1fb5b958c37 100644
> --- a/drivers/net/wireless/ath/ath10k/thermal.h
> +++ b/drivers/net/wireless/ath/ath10k/thermal.h
> @@ -19,6 +19,8 @@ struct ath10k_thermal {
>         /* protected by conf_mutex */
>         u32 throttle_state;
>         u32 quiet_period;
> +       /* the running firmware did not answer a temperature request */
> +       bool broken;
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
