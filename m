Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243341;
	b=YHNOylL2u89MOqCNC4UtPw0AgKf/5Bs+mKdlTHGbouWa0woCPGe22sBKNywrjGlqCGbO
	 RAN8P0cZJeKSWKk/G0VG5pUwsNiZ2NXB1l4bRXxsNRCS4PsDG3ydRgkDYO6ORsLc/fskS
	 t6RwuH1/6ob4984Ku2Xrh+lhaOCUfh2a9zzcGeIzu/++SgV7K2Yxqi3hi24C5HhScEQf/
	 C+UoW3sutk8zOImVAHlXopr/cA4y9xbgNWrRAmWLyd5EbwRzO6fQevBSLut/CZmqEioXy
	 aMq24gmJctd2Hv4RUUvDsz71Zm5W35aqweE03W3djUM8cukjYx6uq85+O5jCgMr7hzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bjV9zPSqZzSjy7az1JAePwYJ6AKs5SGK11NxPTFGx44=;
	b=V2lLGvbps8FWdncjAdG34oE/ESY+lQ8HQ0llH0PFtlL4UjWsSXCtGRJKkB14V67mL8Ev
	 x9Jmh2MRpyai0kSq/g7t+ETQBld+iWdgsh44jhRJv8AShkXqJdv1rpwR0Yh7SyZJ3bIy3
	 yoUI1VxxSrL6l/gce6oJvipYJWHD10+w8uR9cMV4JaZB0MgEaN64X0FPMN91PbdhXAGz7
	 z3bYUpvcHuZo5kzaYPy9pd1NiBy/+DzB9BgLXzIvPXwdReujOcK6dPaVCClLkaxw9SoGt
	 aOUm1UWH8t6a05DmtYDiXLF+b+0lZYOquNd/LNZYNL9KZIuAXJs07Bo2vO9IvesQUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2k2haY3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c9MIWa9T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A5606EEB8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6A5606EEB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2k2haY3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c9MIWa9T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFZnk3461660
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 16:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjV9zPSqZzSjy7az1JAePwYJ6AKs5SGK11NxPTFGx44=; b=T2k2haY3g2VkEIHP
	rxOCj1QXlc7k5c2V3lG6aArRReThBv1wOBb5c7QtL9w+7CTrXzAWe/kdGVWuh+RJ
	JFfXZmEsl/6s9ZnkQ0CbUBxAcdfr6L+9NJKYZnarPJkSUZ1biPjSe41he3KO9b6v
	pIjHH4gIc21NyqPk3ySmyo4T97lVjPhUrdzUdnqP/xCjSxwbnVc7BEFKwV2LaGfu
	FBjfd4kKNhA9fBrDB7dcZuXHPUPjNmGK/l+rW8WfP+yGTh9sps5CTgYXjwtlFbm4
	dI+1mojUKjovCrCnWelwAKWko00uVWuZnb4cKid9d6hdiHmvb0/bZT5ITKtXGeNu
	T/rYDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rs2gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:55:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso1212430eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794243339; x=1794848139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bjV9zPSqZzSjy7az1JAePwYJ6AKs5SGK11NxPTFGx44=;
        b=c9MIWa9TbaqaTZLBMC5VrjGXdrGKgNi6R+6f8Bp5hxdVL7h8pwC8aaeeZRDEv3iAgE
         cEbXuRimNj+FGgv/e6KzN8g+yWlKa2Lo+5tz1bB+7wIcLCta+FvYZl6A9/QZf5wvmXXH
         J586HyDW/l9mJGYzYsOsp+bcUuzLhu41ak0DAJeRilQf6E9BvyZ4BFobU8Fr7Ivqv22F
         in1XvNIrgOXSrWC+WBRKUC+WUuxUtFiQK8Inl8oxD64Q1Wnn0iTPgXlffjkeW2B/mX2E
         XVaZqg2AI7vMFiZp28gBWn92lzyxzFO/HOjvttR0JJgYvZDzV5Dyt5GVdZedm3HsPJRW
         RhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243339; x=1794848139;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjV9zPSqZzSjy7az1JAePwYJ6AKs5SGK11NxPTFGx44=;
        b=o2uu7YYkFnrbyq4Z7EZF0WvW282qLvXhBLYkCW/fqZPHudZ3amcsnISL2Yj+XvUcKE
         BEqDS+MGgVNwsuxHKtW3R7ss+vQaymxAYU4HYNi9hmuBrDvC2WQ6HBUgCGEDZwkkNjbo
         CaRTnwlqaF4rv7T8ypdUVr5UKxT4HFzJoIoboLR0MA3P/USEr/581U+HKSq5NE6H5s5+
         ba/lYk3ARmngrC4+E7Ihf+Y9BKQoLC0sIfeiefo8CuY+412OgH3tekxZVFHs2mz4VPLX
         cNZMFf/t+KyswS5WsfikhyY8o0QzJyAR59C40jqClXIPhMK1v7vBahGpmaSlxakPxWOy
         HTCQ==
X-Forwarded-Encrypted: i=1; AL+hErHjAmJ3LYDBwakTljJSf9lcgOGGOKN6VJIrqeFC5QJzaNlQRMKt02yb0ROtUxqCYbCYPcWqat5PceTbxb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LmaG3pVCpo5N2iFHP6I4REU3TRv71n1plFl9uM0nxgyHDonyJ
	d2JSO6R7ozVRWLQZ/Qmrf4uht7iN9cdcKkaJziBzATchSDZpXYUGYTk0mEZNusrLHQ5YaT70lxz
	cleMmgZvYRSp6MyTk9ApaF5XFY3RIb2rSJMW+z1Q+wfE+kf3otrQEsRcldYVLzbca5x8=
X-Gm-Gg: AYBFou1VfzpuDwHwq/nUlEZUTBxoE3oQKY6bomEqjUS5B2o9gcU8R7v3vZiimL+seje
	8NOPjb0AUHaLQrhqMhKtG7qyCbg6ymSI1Y4qmT8AUECruU+1m4mrfhiQRoYoGYkmW9cSybZZdGp
	qwcJPavU5JBwAecV9SPkPcnoi/frgTFFdkcEoi2ssnswPxPso6ZdXNIqlhbpstiWLOXpBumW+EL
	QubFzWZCUkCj7Zescu0Pxf63KDuKo6PKrb7gV0KkMhu8UxmLilKGGyGISnP8a9uiMgdfHiZZjG3
	+HGkkZ2YDPMPphMuTYBb+Y79kFNiTgC6R7ZHV3FYaI04ABCtkDRY6obqiF5mlNTZi8euQwcvACK
	kbJR1pr11ncjnyPpeFPe5iwOgUJRkzwzbRzd/B2g9EW7lbczY2NKTvcE1R1KK0UbCW295uL10mz
	RUiiPA2VTFoAF5WicSNCT/dI4Zyw==
X-Received: by 2002:a05:701b:4211:10b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b3b5e25ca2mr80086c88.10.1794243338462;
        Mon, 09 Nov 2026 08:55:38 -0800 (PST)
X-Received: by 2002:a05:701b:4211:10b0:181:6b8:31f1 with SMTP id a92af1059eb24-1b3b5e25ca2mr80060c88.10.1794243337940;
        Mon, 09 Nov 2026 08:55:37 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm323466c88.3.2026.11.09.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:37 -0800 (PST)
Date: Mon, 9 Nov 2026 08:55:23 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        David
 Lechner <dlechner@baylibre.com>,
        Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi
 <lorenzo.bianconi83@gmail.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] iio: light: st_uvis25: notify the current trigger when
 done
Message-ID: <20261109085523.0000513e@oss.qualcomm.com>
In-Reply-To: <avGKjh7GOtE2tPGt@lore-desk>
References: <20261109025454.1260519-1-jic23@kernel.org>
	<avGKjh7GOtE2tPGt@lore-desk>
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
X-Proofpoint-GUID: lQoq0QqRsti3tzLSlMoypX9i9cEFgBtN
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1fb0b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bMo6kmeCR_tHdpvFHWUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NyBTYWx0ZWRfX3801/g0tJxeX
 t+/6c+p6MwOmXnKKL5D8BeBpzSo0iysGQSdtqXwY5ZKEsClUIxv14cDTvquFwY1RQWmMwZifNdG
 OkmSvoV8/1FhnbKKb1YPgWodwhnZQ0vObMfQGb31K0MRBo36J0xYz7a26MbwcTr7gYkcxP2Xv26
 WR7cAQ/6nwJBhz9eFA2qpNfstJOqLjkI9QqN5f0V8vj1DFF15a9gQpuv97sneW//HqoFSY+jkcG
 Pyf6J1a4sb16wX5qNnR2RnM9znZMXQCASkxRu5mQVBEjghv2ViUspu3864j3IpXQGL+4k80HzDp
 aBnW46WKRiLY7/A5VC8KqBi36NcvzICPLTjknXKtU9Ctiap76PDZhzYH4TPaLooQkW0m0yWrQct
 MELzu4hZX1EOxExcBzVNCBckQ5HynzOz07HnSoHnvw0Rv8Bp++1EFJj1u8hKM4cZw+8JuLbXSoE
 eJi/HwbVyQI5vpBy4aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NyBTYWx0ZWRfXxHAxH0m5Uk/d
 81+go0zZCXt4N1P6MZ8uHD04Cm5aedUG4eIZb1RRerktNLftw9qFMRRApqCkFyp0U1UDcopHSx4
 0RuuJmRB+Uzf2W4PDkJflZ3vfM8h9qs=
X-Proofpoint-ORIG-GUID: lQoq0QqRsti3tzLSlMoypX9i9cEFgBtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090067

On Mon, 9 Nov 2026 09:55:42 +0100
Lorenzo Bianconi <lorenzo@kernel.org> wrote:

> > From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > 
> > The trigger handler calls iio_trigger_notify_done() on the driver's own
> > trigger rather than on the trigger that is currently in use by the
> > device. The driver does not restrict which trigger may be used, so if
> > another trigger, for example an hrtimer trigger, is selected then that
> > trigger's use_count is never decremented and it stops firing after the
> > first sample. The driver's own trigger use_count also underflows,
> > preventing it from firing later.
> > 
> > Use iio_dev->trig instead.
> > 
> > Fixes: 3025c8688c1e ("iio: light: add support for UVIS25 sensor")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>  
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Given content is all still here, rather than resend immediately to fix
the linux-iio mailing list address, I've just fixed it in this reply.

Thanks Lorenzo.

> 
> > ---
> > Another LLM found one as part of refactoring how all the code around
> > triggers works.  Definitely the wrong trigger. There are lots
> > that access the right trigger via the wrong path (shortly to be
> > cleaned up), this one manages to get the wrong one in many cases!
> > ---
> >  drivers/iio/light/st_uvis25_core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/light/st_uvis25_core.c b/drivers/iio/light/st_uvis25_core.c
> > index 94d5261b2663..5c63a68948d6 100644
> > --- a/drivers/iio/light/st_uvis25_core.c
> > +++ b/drivers/iio/light/st_uvis25_core.c
> > @@ -248,7 +248,7 @@ static irqreturn_t st_uvis25_buffer_handler_thread(int irq, void *p)
> >  				    iio_get_time_ns(iio_dev));
> >  
> >  out:
> > -	iio_trigger_notify_done(hw->trig);
> > +	iio_trigger_notify_done(iio_dev->trig);
> >  
> >  	return IRQ_HANDLED;
> >  }
> > -- 
> > 2.56.0
> >   
> 

