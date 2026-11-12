Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506531;
	b=4wM4hgwL5wSbg7pNGE4IPM2qvXnTgkndOoxxjxv/k0S8zt7ZALY2JxzXwu3xFhzMT1Aj
	 OVYbjvT5tZHDBJBO2+hpHocTW49zqtJEuzdP3KtLgBHDL2sqhY2xS1kdTHztHYvbJP8Ef
	 ySnWUCS9jATTCZozJfUzEp+Y3jEEKANhXIYI9Ok0ZHJ2OHtRUweCvgcpJfnfD+iJW0fGT
	 RaMh46jEtHr7/f8dpuaFcXCtzvgkmGeIkTQwYwYVlIy+R1O7CscBxCsYEb3p6U3Ncgpmn
	 k252ret9tvUyzHBkn+y1EpJM/Thc0GRno7Mg9QGrQ50oR3tdiNO2GZJRNc9Pba4GvVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
	b=KfuuVibCxNKR2Qa//g8XNzmpF34/C/mnGpmEkdfscf02p72nhKOnQWHAzHhVX6j6/2vM
	 KOyrmgShAM4JM1gRHENj0D/oWtVfR8+KRjY/mwTE5HCNpczVmIEIbNOss/0gYXO4QL2t/
	 jNEfLINkv2oUBSft/jbvTRKNO21+EDcmN0ufG+geFCWnSttx+yeTbrhwm6QSETpXLyfL7
	 Rwns771Ov125w+/2bql4pKvXjNeZS5NNrpRglVLlRNuS8OLT0fMDXLMWNcVlTl2gZX10n
	 H84YxeljScbllxRJg7ihEO24iC1c/n7Ktg0JN/3Sw1V/kzaAEDQFlSzM6YtAY0arE2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A2/jZtNk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWIJzLY8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7470606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7470606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2/jZtNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWIJzLY8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZZih656973
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=; b=A2/jZtNklLwEH3VF
	MjxWSGKtysNcngnLz9nCc5sc7/gnGbaGuYZ7zGqVOcKlM3AKsHIhmaDNdYQI4ZWi
	az0VQuSJZy2CM9eerFUxN61c5NsUuQzxiT8gItwg263EYYQpvSe2OFTk1hHyIHWv
	zj2A5PMIXu8TmQfB+bV94iuGZi7aE2RXG7j/lEkQz0san5pM0oxql7aDbK002WSr
	q3YACElXm56wWe+/r/V6oMS73GNwJk13I7nFJ22sdQaxoLFya70HPeAgeXEJhP2C
	IZFSFwkvlw+nRnbXeumYkkoleNslYC3xwOyapsv/o/316CYMF4zOohQxHMX4w/kE
	hE54bQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yujuhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:02:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso453241eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794506529; x=1795111329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=IWIJzLY82eJhjx1LDl4M8p9/EuzkwvdbjMobocgD6rzIEUFY9Jlhrk4mbqisvSR+wa
         i7kH9LefCVY8pMurhzyEs1l/69Jr/TsmFZNIPhXQtUPfWyUOKAIVszNpiYuMgWy0UNd2
         8F5Gw7EUhEwypI5N2ByJFGSZu9sAhLoIc1TAIymdH3mzzPADwFALm1txD5H6igR5sopO
         UGXmX62Vb33o9/Oww3gqrXidBn9azUhzCyExF6CEEF5M0NMNAphUnCBjs5n3MecOFgd0
         Ip7yOElPuVXvhHFn7gfDpP+TpJNQ5fFnzyJDK1Mt3eXkuPUEl55GsGol65FtvMbS05tu
         TWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506529; x=1795111329;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/q+HZAXO33VdMbT6NBmFvKukVr7avEJ3PXxPK7OsNsg=;
        b=idvuayW+/5CxgAjjjI2C8hA9W464jR6gPqZmGQp2VrgjNXg5E7F/zrbweRc0nYIdRn
         bq/0bzppkKNe7cinUdBTVNslhYMJAmUyjUc+SA6r8wZn3rHZSSrbXz1eiqFM5uv3Z3nK
         k0n3pVqnedrQM0NQe3Y2Xsy4yLrkwM3ApF0NBwm8P+Mu1IQBIpyTWIN7Q8mnHaEVvxwu
         96yb1ssHNttcdxB/wruA56nSz+KpOteoDistF1cT5We0KkUZ1QiNfkMz+iJKNZQ5G51z
         /TRO4J7VTIdorS265tzNG6FMVoHx1EYOJYhmPSzDbZVKBo4xUxDaWeTP8v5Jg9Mmn9vg
         hVQQ==
X-Gm-Message-State: APuU4Z8QcOo96H0ZwiuOAikLJ7ONbNiQ5cIzhd3Ze5zINMP09hWusAfW
	s/olaJ5EgAstU8OSQ/GQRw5GeMm54WPrgbHhPndHsdGqDa3IGvy7ZVEbYf3bn+PGIR+l1jLeUiI
	6KNmvKQP5lWOglzRNXhDpcd1rFltdV+UyM0WH5abwa6NXWq3haK11lyPhzZcaFzPRqCE=
X-Gm-Gg: AYBFou0KKEoJaBD7oqsFDHYu0A8YT/4CKCczifbp37lWCv9c9WO6ahTiMzYUpOwGkoB
	793tX/USjoFzgJyAVF9li/0agvqw0asnMgtVOibnydkc5icYVV6oo8giraMzjde90Tq+zIton08
	6uScIKpO+uQQOAq0V1MDnTO3Uge+CBSKYTp/DIeVtLcwf2m8ojvXy4kikn6CpTJGZbICNOXUhwX
	N3z2Kv7H/V5+tDFpSxAnRhqnJINSk5Bg+2eVUhQqLOd4uq7z43T4B/O/OXzQSrKENhhdftGL225
	Nozvh1MkgqF68I3WqRvncfxF20egVUkKEnsULdnDiBv47Z0iGNTUZl5y4DoG8IbP0Ec0Ev9LtBg
	WimlUxKyZxRerUt1kxQwszMTWDs45TbsNY7kQFInqXQFvPupcmCoERj/lFy1Fjq3w/VS+ZjcSJj
	qoqi0nL0M87KgNeR+r28461TkBI58=
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6022217eec.38.1794506529178;
        Thu, 12 Nov 2026 10:02:09 -0800 (PST)
X-Received: by 2002:a05:7300:fc0e:b0:376:9e80:2bf5 with SMTP id 5a478bee46e88-3769e8f760amr6021582eec.38.1794506510251;
        Thu, 12 Nov 2026 10:01:50 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm510064eec.8.2026.11.12.10.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:01:49 -0800 (PST)
Date: Thu, 12 Nov 2026 10:01:45 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261112100145.00000560@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-11-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5vmRWgPTZZCtYwGcNPTFkP9O7U0WfqdQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfXzdbTJvVunwY/
 LtmlTkP8sn/SBwzi3YziwN5B8SG4tBu5pHHW+S1YRa6nCm66ghaNvTZDJmp6lIXdIRm0VmcqWr1
 tNz1KgTI86fB4qi0M1JDfS6PE4MBMZc=
X-Proofpoint-ORIG-GUID: 5vmRWgPTZZCtYwGcNPTFkP9O7U0WfqdQ
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5ff22 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=eWwvBSKlxOWLqK439NMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MSBTYWx0ZWRfX97NkbatpUsh6
 +RpwmqNHv+ZZHm98y18KUXi8LIfLGMYjkrpQLg560YpvQkXjhHzu4nC2KsSngvU0fj5UPuhSQfx
 gX8E5GPaMEOK6Cr4Cqup9q9fUZ3/QiWds8hzdScRyOnvaNb5OHax3TEoGFpipiZxurfKaGMROlh
 Fo3Fohzn9dP4NKEXhLT9eorS2IXc88/waB3UGH6LgqdcqqpEvAKNRo0HZ+A43f+jV8ETe9QC/fo
 NiEYGX5wMyln1sxtJGdPBGEmI6ykpcz1hNMbj2NhZkLJ4hkpdQy17eOT8jqBxZTiI+YNlNJ7Ln/
 Hse6GIsglbe/oFiLaNtNG/VZ+sNjUnCStbG4mAa3d910DJhNPo5XZFbtEM8qrUtgyZs/tDQb891
 293TpAgl//9TPggWyLeDQDAdrDkplmlSaeu50tzb+MIaiEUcR+v9W9teFEHF+tLFxhPpvNojS5t
 /ICwc70XQ0rrXocUhlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120071

On Mon,  9 Nov 2026 09:11:56 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add basic Telemetry allocation and initialization routines, introducing and
> wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> optionally using a lazy on-demand scheme: this approach factors in the
> flexibility needed to minimize the amount of initialization work based on
> the effective access pattern used by the upper layer ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

This stretches across the patch set but first elements related to it are
in this patch.  How do we handle larger values of de_data_sz?

The spec allows (and it's useful for things like histograms)
DEs to have an integer multiple of 64 bits for a single element.
In the shared memory buffer that just ends up with a bunch of matching
IDs with discovery via the parsing done in this patch.

The only (I think) today to dump that from this patch set is
to use the shmti dump interface.  That's not exactly nice!

I messed around with (well chatted with an LLM about) a couple of
options.

1. Make the whole stack aware of multi line DEs. So all the requests
   get to return more data.
2. Adding indexing so you can get a multi line DE in multiple calls.
   That makes the interface for a bulk read a bit odd.  Userspace will
   have to be cleverer given variable sized elements.

Given this is a ABI related aspect, needs figuring out sooner rather
than later I think.

Which way do you think makes more sense?  Or am I missing something?

Jonathan



