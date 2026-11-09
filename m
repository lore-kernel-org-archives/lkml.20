Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794214208;
	b=jEYBNW5jvmBTenF9hGVqPziqbvMZOG4PlxaTYsw4FlzODxKtS+JTXxVcvAPJELva2K1A
	 ybcpXpPFMI040ZtiEN3myP08UguEWx5qjdukah9tRzzax19h/cRYz6PHROKaYo8RAbHL8
	 zq0/+ADvlqhNz6vKV5EUrmmtGxcnEsQR8q7sG9Xm+0YwJejcfXKhz648UWbAqCHdHQZYl
	 EyMTmnNZOpCiD6FFAa6f0e8U66G6dGgxJqj6aO9T+Z7vyE8I2jVfzB6uyF7EqKYfwjFlF
	 eVnYsTx6ahXh4h5qbcb9b+eVGx9rqmCzFMlCGN1UZHGiUBwHkU1zQJdgQ5Of7aHB9XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
	b=OhnmNkY3rwcLOAyrM/nycaZzswFqVbwLtnTHMM+G/lgXzJ3POjO8KAEvBv/HRLU5XvQb
	 gwY6d5KnzmihZPk1x15sdPklf/hyjeuBe+oGifT0CflH6PAovbMmS2GiU5arPiECZjKug
	 iakzTknIKxOXhJBLuL624JIHOlQifWTYcJdBHYUGL7ePB9kiBl2E4f3VH/tB08MIZGUxk
	 wO6r4zoq0+VJX0cMF7niRirssDwdeLpveMYQvg9bWMAlPuW9vIdd2PYI+BiOayRgHqq+A
	 BUbWbqOvNwFZqMnONbc/b5Rm9Cg/Z/WKv9XaQL6K3j0EvrDbJ0XJJ5YsbB1YQCUNCkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG9OE5kW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doDoc+Nv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F656082BDD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F656082BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG9OE5kW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=doDoc+Nv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A268481139
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=; b=CG9OE5kW/7MuKcxj
	yZICS46QXDIo/e5a7OKRHgOYpIsLdfjmbb8i6NkMdmptVabkAOfT83fyvsHPEZ0q
	VRThHoqrMQb5zBPh66tqjgC6TPYYYjEqtrVEQHJMxC7aneOCAYqcV0raF7gfwYT+
	XWnmpematdrP3ZzqUtHIGWdGnbXu6lD/qRZD+dNC2HcO59d0HmP7oajU9ztPR94U
	lKzFOlHIbuMFWnaFUPI05UCqCM8C84173+RHpQwJ7k16hDJJ+gQ6Rab2ekzV9CDt
	00cRIdZi3yCqaF+tbzQ2b24mQ/tARKq8rwW8EJronvuik5KBmD5fOAngo/3iy3qz
	kmA+Zw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsdmg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:50:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso175252085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794214206; cv=none;
        d=google.com; s=arc-20260327;
        b=YL7L5s8Z8cJI2I4tgf2PJevcKDRkf7mIqTbZyWvs+w2YOcfruJ6DKK4B9logVcDOWl
         0qaXfTy8+Hz/zrY7csinPdCqMrRGS9scxm5aEBsqJ4/FtaNQze1jvjFtm53GW4AGnhHa
         4Ex5R5MxDuUTchoKNtsuDKDDCYKPj/IivphOT9AvIoT8bmJA+u0NJu+iaAV2gDdZ7a3h
         a/edMnO5pU9n81L4mDahkgx7wRXIxqzBG6ytsU37h9SIbckjrgpRllrMBynfeuxHOxrc
         8RQZwzaMHJTc6mHhu2I8fOigpd97oOH2us4h+LGlV5+77wRF+DnKv/y/nIVpV8ueUfLA
         isGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
        fh=eitgLO1NLbbvaF6jSz4w2adGeD+sWe9x/YaGpsF89g0=;
        b=F7Yu39Tk+j1sHcTkxxuepuxMPo6H27ljWKiIOX1jO7spxBKik4IU9lS3v2Q2J2m/1S
         G5ptr4oYDWl/BcgicFHq2z2yksie/5SJSrKdbiEUn9STPxUcI4Hmp4tfwB+E7VkxrFcJ
         TEDywLVVJFDJXroaKwLuVe2GoZqww0kY28Pe8d1fM3yQ3QF+UfZvcUN1Z1F/+BO/Ui5u
         xWSDvip1mPCn9SXGM1hjm0hHxxXl0Vhw1v6czglzlPbF8gM7BmbtkWj3cJGWHHYOHSOh
         KVX7CVURRwzifgBj72Jgaq1F80X7fgdS5kzl3WqKCwtH/46OjiSWz5dOjVMqK8/cEVOx
         UuNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214206; x=1794819006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
        b=doDoc+NvZ0gwYXx9sHVWbvpMAyXaJsW8y3m6D2XgAkrAi+A+VcNB3W4bOKQI4CLAtV
         MUTPfoJtn9IYddx7JDZO35KvUbned+E+tpeWNJrMMsE+s/fYx3u6erfKjV5qWSLZ8qy2
         8jc1PbQJpb/jIgwtYxM47MuFNldu+3ZqXKSGi1RQM/ZR/pX4k9IRmnGnImacaENp0qcB
         isGH7q5aBviaLv6DNZjlzatdz9ugxETRzoPg+glQvoGMXbW1ff0hBPt/Ti/mc4bWIXD/
         +Ef8eGb54rKps3RSofXoAq1B8lTZ+inCZ6v+j0YQBOk5qqaFHKLpbUGj4H4llikjYveW
         TXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214206; x=1794819006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeANruJ67tcK1i2NjImgpuPLAyqp2ow3pBUPvp4p0h0=;
        b=Q4/W6++wglsVI4kIRaaZ7EacuQLKI21bwwpzqwwLwkvOoA3rl+fVNB2n654fbblm66
         FJsgj7cmYTCy0I0bDF5ZwjFp6fwNC76aZwZKkwPLHc1U3xwwOfosqGhDnhhwzkyqYAtE
         BDRvtSbr61OWQ5BQ3ze35B55pT2y6QjiUgJEODs66W/S35qMcp0xWqTxK4qhxsO6U9sZ
         NryZroOmjHcYPhyMCzsUIBaeg7jt8y8CBiiCou5OYA8PTNQX9RSyg9xuDTp84VzcU9aD
         LgvwtCJzTgqYaFCdgKPB4WRomXe87if/Hdmdblc9xnerZWaTpgGIUyzZSi4gJoZMVk+b
         YlQw==
X-Forwarded-Encrypted: i=1; AL+hErFQ67EGNsKNVUkHGt5EdC0cBEdp42VuBxZwId299MWHL2xV1Lfa6vTDOaESvRtF0UozGaA81RF2IQo3oEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zdhJTpUGXXyOdwn3IERzS1SOvBRSgevKk+v4QAwr/pP9LM6rF
	fVXNT5qppvQJHp2XYncsiRS7i3l06PMdcJAPBWSki8vDLcyqT1+17ohSoPD2go0AyL06VhUI+lc
	EAiExLDiNVt1jBhPbirtS3FkkmyUxR2hc2oCy7GILz4g0iRP3zvjmcuO5cnZFB0rKuj8Cnyh20t
	a6I2J6SwmBnjfZW6T/DMH2+uX15rH3h1onEJ/hNn5dQg==
X-Gm-Gg: AYBFou1+ET5jJfuanD7EdSzsoOSdPsp7UpcHNwZkv89yBRmuj8eZfVN9xPuqwxB8grc
	LFMLGJJXx6EUHgaHdZiCuRR+VKjQ7IIMInnu//AkJMdYWFFZfnM2Qaq8SCEW3Ma5mBDD75swito
	L+z0dtMg4ZyZMaWJKnTTrv99dwTywmjoTXNMy22eUD+0e292DKLXXFeMgTIuJTOVqSp6BRiBld/
	PHMJ9b6CworP9L3oReSVSeyvgSWbl+G2NnGZowajdZAgrnXctuV8ponnuJERhm1AoGnNr14E7o=
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:43fe with SMTP id af79cd13be357-9478490d6efmr441773585a.75.1794214205611;
        Mon, 09 Nov 2026 00:50:05 -0800 (PST)
X-Received: by 2002:a05:620a:1999:b0:93e:c12c:43fe with SMTP id
 af79cd13be357-9478490d6efmr441770485a.75.1794214204964; Mon, 09 Nov 2026
 00:50:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
 <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
 <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
 <187f3c63-5550-4a42-892e-ea660247edc9@oss.qualcomm.com> <CAFEp6-2nSM6zgyrgxwP=qrE3K7aXk9cSZmhdY2F9N4Zq8SV4Kw@mail.gmail.com>
 <294563dc-1db3-43d0-8173-7941633bc659@oss.qualcomm.com>
In-Reply-To: <294563dc-1db3-43d0-8173-7941633bc659@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:49:51 +0100
X-Gm-Features: AclHuK8d7U60JHFX2WPQBgobgNeEmG2I6oVdvjvAApI2hLqbyPzNogR0RSlhgW0
Message-ID: <CAFEp6-2HpEAABdJLEs+yaGyyPmKvqcFPm0v7FbFoW+grw4iYyQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: aj_vUlcWOOVnAtyMZ-KZKOZ6YzznG_X5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX0TtMvgHlWqUD
 3V2TYr6M6PDwvZLNRZnE6tCg+AApjsAuYSN29N5FlJc9qzok5jecF6ukVit3SHxH+8n10BNF7QU
 4cs0Nmti4BrrKx9/OfeW2+6vV4C6Iw0=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af1893e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=ra3N8ZK0SJvzCLkdQ28A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX3fTE/D1W10Xp
 //cSxh/pfCqD5dQ9cbV/K80QOjw0xHgXzGKtwn6fmbiCvypb7Siy1WBjYD+Mn9via815hwKUrK1
 KOhZ6hKQh0EnCrsURG7cwTNLmX5ifgSaDohKT+mqn13HducsCDUnujg7eJ76XWklnGMjyoyhuH+
 u4SCg88wm7xwI/RDbnvPp0lv1icy0vFD8QYBlk3qjZYftikipye3MmgO85YaxuYW0qYbLyAx2O7
 89m4jbmHEC0QdCOLtieTpP1PB5lUssTS6oNs26YK9NGfqTEDI2JTQAM700bV8t4YdFD1o2P/ALR
 1PMGR6+KwPEclrC8AWN2ufY5bmFJZ6sjL0o29IkWWpD72zzuC1l0RiAEHwSFuZVdKgb2nL4xOaI
 BtUC82flnbvBp/JouDWf27Rxpi/ts+c7C23mhCrjGIVFJQihlsCPFLEQtZOREjOchGFqXNRDcpD
 S8kI81lS4qaeDa8X6JQ==
X-Proofpoint-GUID: aj_vUlcWOOVnAtyMZ-KZKOZ6YzznG_X5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On Mon, Nov 9, 2026 at 9:11=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
>
> On 06-11-2026 01:59 pm, Loic Poulain wrote:
> > On Fri, Nov 6, 2026 at 5:36=E2=80=AFAM Vishnu Santhosh
> > <vishnu.santhosh@oss.qualcomm.com> wrote:
> >>
> >> On 05-11-2026 07:51 pm, Loic Poulain wrote:
> >>> On Thu, Nov 5, 2026 at 11:42=E2=80=AFAM Vishnu Santhosh
> >>> <vishnu.santhosh@oss.qualcomm.com> wrote:
> >>>> Some Qualcomm SoCs, such as Shikra, run the modem in a separate secu=
rity
> >>>> domain with restricted access to system memory. BAM-DMUX DMA mapping=
s
> >>>> and BAM descriptor FIFOs must therefore be constrained to a designat=
ed
> >>>> memory region that can be shared with the modem. Accesses outside th=
at
> >>>> region can trigger an XPU violation.
> >>>>
> >>>> When qcom,vmid is present, require a restricted DMA pool and assign =
the
> >>>> entire pool to both the local and remote execution environments befo=
re
> >>>> requesting the DMA channels.
> >>>>
> >>>> This ensures that BAM-DMUX mappings are within the assigned region. =
When
> >>>> the BAM DMA controller references the same pool, its descriptor FIFO=
s
> >>>> are covered by the assignment as well.
> >>>>
> >>>> Track the assigned execution environments explicitly and reclaim the
> >>>> pool for the local environment after DMA channels and mappings are
> >>>> released during remove or probe error cleanup. Skip the reclaim and
> >>>> leave the pool assigned if the remote side still holds its power vot=
e,
> >>>> since it may still access the pool.
> >>>>
> >>>> Fail probing when restricted DMA pool support is unavailable, when t=
he
> >>>> VMID property is malformed, when memory-region is missing, or when t=
he
> >>>> restricted DMA pool is not attached to the device.
> >>>>
> >>>> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >>>> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> >>>> ---
> >>>>    drivers/net/wwan/Kconfig         |   1 +
> >>>>    drivers/net/wwan/qcom_bam_dmux.c | 108 ++++++++++++++++++++++++++=
++++++++++++-
> >>>>    2 files changed, 107 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> >>>> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c56231615269698=
140187ca3141dfe48dbf 100644
> >>>> --- a/drivers/net/wwan/Kconfig
> >>>> +++ b/drivers/net/wwan/Kconfig
> >>>> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
> >>>>    config QCOM_BAM_DMUX
> >>>>           tristate "Qualcomm BAM-DMUX WWAN network driver"
> >>>>           depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPIL=
E_TEST
> >>>> +       select QCOM_SCM
> >>>>           help
> >>>>             The BAM Data Multiplexer provides access to the network =
data channels
> >>>>             of modems integrated into many older Qualcomm SoCs, e.g.=
 Qualcomm
> >>>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qco=
m_bam_dmux.c
> >>>> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e8=
9837f296ee13c0c31c9b 100644
> >>>> --- a/drivers/net/wwan/qcom_bam_dmux.c
> >>>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> >>>> @@ -9,14 +9,17 @@
> >>>>    #include <linux/completion.h>
> >>>>    #include <linux/dma-mapping.h>
> >>>>    #include <linux/dmaengine.h>
> >>>> +#include <linux/firmware/qcom/qcom_scm.h>
> >>>>    #include <linux/if_arp.h>
> >>>>    #include <linux/interrupt.h>
> >>>>    #include <linux/module.h>
> >>>>    #include <linux/netdevice.h>
> >>>> +#include <linux/of_reserved_mem.h>
> >>>>    #include <linux/platform_device.h>
> >>>>    #include <linux/pm_runtime.h>
> >>>>    #include <linux/soc/qcom/smem_state.h>
> >>>>    #include <linux/spinlock.h>
> >>>> +#include <linux/swiotlb.h>
> >>>>    #include <linux/wait.h>
> >>>>    #include <linux/workqueue.h>
> >>>>    #include <net/pkt_sched.h>
> >>>> @@ -75,6 +78,9 @@ struct bam_dmux {
> >>>>           struct completion pc_ack_completion;
> >>>>
> >>>>           struct dma_chan *rx, *tx;
> >>>> +       phys_addr_t dma_pool_base;
> >>>> +       size_t dma_pool_size;
> >>>> +       u64 dma_pool_perms;
> >>>>           struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
> >>>>           struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
> >>>>           spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> >>>> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resu=
me(struct device *dev)
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> >>>> +{
> >>>> +       struct device *dev =3D dmux->dev;
> >>>> +       struct device_node *rmem_np;
> >>>> +       struct reserved_mem *rmem;
> >>>> +       struct qcom_scm_vmperm dst[2];
> >>>> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> >>>> +       u32 vmid;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> >>>> +               return 0;
> >>>> +
> >>>> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmi=
d);
> >>>> +       if (ret)
> >>>> +               return dev_err_probe(dev, ret, "Failed to read qcom,=
vmid\n");
> >>>> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYP=
E(u64))
> >>>> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmi=
d %u\n", vmid);
> >>>> +
> >>>> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> >>>> +               return dev_err_probe(dev, -EOPNOTSUPP,
> >>>> +                                    "qcom,vmid requires DMA_RESTRIC=
TED_POOL\n");
> >>>> +
> >>>> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", =
0);
> >>>> +       if (!rmem_np)
> >>>> +               return dev_err_probe(dev, -EINVAL,
> >>>> +                                            "qcom,vmid requires mem=
ory-region\n");
> >>>> +
> >>>> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> >>>> +       of_node_put(rmem_np);
> >>>> +       if (!rmem)
> >>>> +               return dev_err_probe(dev, -EINVAL,
> >>>> +                                            "Failed to look up rest=
ricted DMA pool\n");
> >>>> +
> >>>> +       if (!is_swiotlb_for_alloc(dev))
> >>>> +               return dev_err_probe(dev, -EINVAL,
> >>>> +                                    "Restricted DMA pool not attach=
ed\n");
> >>>> +
> >>>> +       if (!qcom_scm_is_available())
> >>>> +               return -EPROBE_DEFER;
> >>>> +
> >>>> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> >>>> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> >>>> +       dst[1].vmid =3D vmid;
> >>>> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> >>>> +
> >>>> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, ds=
t,
> >>>> +                                 ARRAY_SIZE(dst));
> >>>> +       if (ret)
> >>>> +               return dev_err_probe(dev, ret,
> >>>> +                                    "SCM assign restricted DMA pool=
 failed\n");
> >>>> +
> >>>> +       dmux->dma_pool_base =3D rmem->base;
> >>>> +       dmux->dma_pool_size =3D rmem->size;
> >>>> +       /* Track the destination VMIDs explicitly for the reclaim op=
eration. */
> >>>> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_U=
LL(vmid);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> >>>> +{
> >>>> +       struct qcom_scm_vmperm hlos =3D {
> >>>> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> >>>> +               .perm =3D QCOM_SCM_PERM_RW,
> >>>> +       };
> >>>> +       u64 src =3D dmux->dma_pool_perms;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (!dmux->dma_pool_perms)
> >>>> +               return;
> >>>> +
> >>>> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_p=
ool_size, &src,
> >>>> +                                 &hlos, 1);
> >>>> +       if (ret) {
> >>>> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool =
failed: %d\n", ret);
> >>>> +               return;
> >>>> +       }
> >>>> +
> >>>> +       dmux->dma_pool_perms =3D 0;
> >>>> +}
> >>>> +
> >>>> +static void bam_dmux_remove(struct platform_device *pdev);
> >>>> +
> >>>>    static int bam_dmux_probe(struct platform_device *pdev)
> >>>>    {
> >>>>           struct device *dev =3D &pdev->dev;
> >>>> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_devic=
e *pdev)
> >>>>                                        "Failed to get pc-ack state\n=
");
> >>>>           dmux->pc_ack_mask =3D BIT(bit);
> >>>>
> >>>> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> >>>> +       if (ret)
> >>>> +               return ret;
> >>>> +
> >>>>           init_waitqueue_head(&dmux->pc_wait);
> >>>>           init_completion(&dmux->pc_ack_completion);
> >>>>           complete_all(&dmux->pc_ack_completion);
> >>>> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_devic=
e *pdev)
> >>>>
> >>>>           ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_=
LINE_LEVEL,
> >>>>                                       &dmux->pc_state);
> >>>> -       if (ret)
> >>>> -               goto err_disable_pm;
> >>>> +       if (ret) {
> >>>> +               /* The PC IRQ may already have powered up the RX pat=
h */
> >>>> +               bam_dmux_remove(pdev);
> >>> it's still unclear in the comment and commit message why we can't go
> >>> with err_disable_pm?
> >> Agreed. I plan to update the comment in the next revision to:
> >>
> >> /*
> >>    * The PC IRQ is already enabled and may have powered up the RX
> >>    * path. Use the full remove() teardown so that RX DMA is stopped
> >>    * before the pool is reclaimed.
> >>    */
> >>
> >> and add to the commit message:
> >>
> >> If probe fails after the PC IRQ has been requested, clean up through
> >> bam_dmux_remove(), since the IRQ may already have powered up the RX
> >> path, which must be torn down before the pool is reclaimed.
> >>
> >> Does this look fine to you?
> > That looks good, yes. Also, could this be avoided by requesting the
> > IRQ with IRQF_NO_AUTOEN and only enabling it at the end of the probe
> > sequence?
>
> Yes, that is simpler. The PC IRQ then cannot run before probe enables
> it, so an irq_get_irqchip_state() failure can use err_disable_pm and
> the remove() call and its forward declaration go away.
>
> For v6:
>
> ret =3D devm_request_threaded_irq(dev, dmux->pc_irq, NULL,
>             bam_dmux_pc_irq,
>             IRQF_ONESHOT | IRQF_NO_AUTOEN,
>             NULL, dmux);
>
> if (ret)
>      goto err_disable_pm;
>
> [...]
>
> enable_irq(dmux->pc_irq);
>
> return 0;
>
> Does this look fine?

Yes.

Regards,
Loic

>
>
> Thanks,
> Vishnu
>
> >>>> +               return ret;
> >>>> +       }
> >>>>
> >>>>           /* Check if remote finished initialization before us */
> >>>>           if (dmux->pc_state) {
> >>>> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device=
 *pdev)
> >>>>    err_disable_pm:
> >>>>           pm_runtime_disable(dev);
> >>>>           pm_runtime_dont_use_autosuspend(dev);
> >>>> +       bam_dmux_reclaim_dma_pool(dmux);
> >>>>           return ret;
> >>>>    }
> >>>>
> >>>> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_dev=
ice *pdev)
> >>>>           disable_irq(dmux->pc_irq);
> >>>>           bam_dmux_power_off(dmux);
> >>>>           bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> >>>> +
> >>>> +       /* The remote side may still access the pool if it holds its=
 power vote */
> >>>> +       if (!dmux->pc_state)
> >>>> +               bam_dmux_reclaim_dma_pool(dmux);
> >>>> +       else if (dmux->dma_pool_perms)
> >>>> +               dev_warn(dev, "Leaving restricted DMA pool assigned =
to remote\n");
> >>>>    }
> >>>>
> >>>>    static const struct dev_pm_ops bam_dmux_pm_ops =3D {
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
