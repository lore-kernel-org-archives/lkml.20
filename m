Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EEA3B14A7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744042; cv=pass; b=ChjP8a649ZYfeNZrJVv8Bl4i618HiUskC1JBsGVE3v1CoNJODBRAlHIxuFWJSXNhr9T6457LbMOEPmFSraptrX3mLPIXwy02ecyR5MeVD03NiLlnB9Atg8M7GZqA83B00fv4o8Yde78h+jxye4k1FCXnib04YY/NK94+Fede19A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744042; c=relaxed/simple;
	bh=F5Bm/0SSJaRNsY0ywkSx+Iic4yb+uKAS3tZ4ccoODFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsGQPO6xv4/iaYTzTbisPZZIrSm31KCNG8fIHzrO/VCv9hJxEtgsrUoumKpln6MUsUddxFFu4zOTX2vKje8OqvGBBBDODOUABTO0l1hYqeFtVbDa7QWJqMw2bH3Lqa3QeucEC+TE0BxzB2rlc/JZz1EaolEzhodeh1sA5JkUVZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gmKkSSnR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QimKZJsx; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gmKkSSnR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QimKZJsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787744039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
	b=gmKkSSnRNYMRaWuD2R5khxrDaQPgFUVFQOGrTTGXButFp8rWf4VGAcLxGKA+MLGHHvtoRC
	F7W7VP5yLL4wR9CSVqVQ2Z+sH08cBBoBiHytEBggA3ge7y2Jy2rlgyuOX7EOZy9ivoKmyh
	ucwZI3ND6j/1WVirLWy0SrTKru0SLrk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-a__pkPcONJSLzpjxE8OowA-1; Wed, 26 Aug 2026 07:33:58 -0400
X-MC-Unique: a__pkPcONJSLzpjxE8OowA-1
X-Mimecast-MFC-AGG-ID: a__pkPcONJSLzpjxE8OowA_1787744037
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-853a9c4c99eso25866177b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787744037; cv=none;
        d=google.com; s=arc-20260327;
        b=kqb/LjKSpNdlBadan10E41KHQPfAIsBM0qvHxOTSYMx08DFvJB0MhU76zKW8kZB7QR
         guXcLv9CiDbL+a9i/LiZYhnlHHQo4EcLb5DeEGc5s8ZHRdqdpvUX08g4RbqbwZN6qpkj
         p214n/gGe4eoXOWOUhsKDyzL62fgCh51Fx+IkXDs8OhPmIS3K4Q+ut1hl3WrI8ILqsjZ
         VsSMG8UG0Cu/im884dGZZiAhnZhrPQ/mP8BO3z+6ke/DgShE8w7edqM/TfIc6ycE2eVp
         51uKPQqXgmwVZ7a9eFKONCLOCLEPE8bN2sXjlb3H0OECqXMW34f+tviuBeDyHBViSWDz
         ggIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
        fh=h/gR25F7EwGGx12CDyoNBZRWhyiWzO6P5aBfY99Z32c=;
        b=BtZT9QvpL5xc7NgzETkFrf3QSnBD6on2NyJqW53jrc0dv+AU4pDYy4wSSZqXGbbDXa
         wxDpS9qIhPQ70PEoarJDCe1XjN7KqCdcooDZM8kjY7LS00GOIbSAXgwt5onZToRtOF62
         fU+BAt1qgj+NOWUfrxno63kd0aRROym07BiJDHqbe6sxPJ0hvKUxK59oTfh5ScDn36x2
         FDtOqmjgkWJX5hXLwLjQoxJzWfgPi6bbIatUrGWhKxD83yfjctq175WzWifsWh/kP2at
         4LKdwOMHclt7Wjj5l7aia/8AsJ/A2+7FZKlV+v4cSOeyBmo+msIVy0bBKiDUsqRFa11R
         3/jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787744037; x=1788348837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
        b=QimKZJsxSPBqSRiisywEtWkCHzUEIzL+RpvzApbj4tuZ5Hhs7//IeHYPgj57Aunsg1
         8ttWh5DzdtlA2MoWOxCU7L0Z1R+Wdo/Io6OjnPYsTlq1xEZzws9m3jR1XvWHuh6k3qe1
         0eb5VdUxver4awXm3wCarVzE0blZzjNqNWIR/gZhU8EHNdKBlq4GEmoFwa73eof3gCFU
         C6F9XXECFakuWAeTP0Dr1ScAH3+SMebLa+5mRgL/Lc+LkJex6owyfhu80DKJExP9GA+v
         F6brqqzTcUR5EW643IvwTIL3ikElg7u3M/+mFNHcFhT/Pd2KwElWeBChJJvgVR1SO6Yg
         gGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744037; x=1788348837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3iwTM4/NXsDryyFjvTD6o3COBIMHHpvoiuq4PcLbR4=;
        b=NELZwolhh1/0hLq1RzO1mKNjeWvNyynWt3AFIuTPoKaf7rLU4n+7zn6RrbDdub7Hvp
         wUyb6J4tE+vHvwxJPi1qSPZwH41Ikf/c4AqskpGoonYy3qaa3bmYdFkcWkv66Nc0QKRg
         +UbCf6Iw/b/C2pxYCI0ILnbAbTYxAfPDfA0YgDNdULCgudaRKkuaNlqAYaIG+bhnFEXr
         Gxgfrq8zClXwePTJCqPLLGRBaH1cw1YBQtTefWZwyrpysEu1MXUT3zvC/nne+UNkIpt6
         RrNxwYeV0Y8+VikLaEOsR0ft3qGkOcglrnoCTk8hMmq/RO1pYkDy/2Bs1PxXtrZ0nALJ
         B2kw==
X-Forwarded-Encrypted: i=1; AHgh+Rr67QdN/0zGPfR9EEArD0YjW5znBo2xEmIhS8qgEejLlZnfh3DRfuBrDRbBQ0+y65Ug9Tj2Fk9JsqydvoA=@vger.kernel.org
X-Gm-Message-State: AFuF++mncGedn+Mv7uZ8ioz149IbBJb3KPPinE0mKwfjxsgw1T7CLlp3
	tE3aRY392guGZigQp5SvQIcAkgGz6baoHwErCGxo1oKySW0oFtTzboDsetu2bN01TbyHrlA1Q76
	AqtTsDZ5kx58Ys5WI1+eYH/pgxHAOZ+sBFl30TfeudLIDeNgIzl9DofFHeD4Agp1CiXBp+fJMs8
	Tt0v5mPFJhhrombkKCFDnmeRAMnCcaWSY7yAksrrzt
X-Gm-Gg: AR+sD128kv02TXw0GmquZiAo4ov84AMpC6DKtHLZr/Y6/1vjCGFgfS8HsrdDV6tj3sE
	15J2cSaPEljC0vtgHdmkP5VWX8LUudiNzBp4nJvoECEXcPnFCY6y9zQjRNR+HXtDsOv3zRrEg+U
	6LUdbMmIo+jTpdRNElaSZY4Z4XCpoLtA+YlDqSYAQcOUTFuFI0NxJnvzY=
X-Received: by 2002:a05:690c:c50f:b0:858:d554:79e4 with SMTP id 00721157ae682-858d5547cd3mr6008467b3.20.1787744037484;
        Wed, 26 Aug 2026 04:33:57 -0700 (PDT)
X-Received: by 2002:a05:690c:c50f:b0:858:d554:79e4 with SMTP id
 00721157ae682-858d5547cd3mr6008167b3.20.1787744036907; Wed, 26 Aug 2026
 04:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
 <20260824-port-scm-patches-v1-1-1dfd69374402@redhat.com> <eee2a3eb-6199-495b-880a-7c94a697d900@oss.qualcomm.com>
In-Reply-To: <eee2a3eb-6199-495b-880a-7c94a697d900@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 26 Aug 2026 13:33:44 +0200
X-Gm-Features: AcwNN1Uf-6mEaAa__uwo9Wqh9y-NbWXXV962lwGBnXUqi5hukOsCIU6XqJAp0n0
Message-ID: <CADSE00LgbuWkfQeTr6RgRTA3BP2Y5WccufjFypGVXwrVs_Q=Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Introduce new locking mechanism
 for SCM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ninad Naik <quic_ninanaik@quicinc.com>, Murali Nalajala <quic_mnalajal@quicinc.com>, 
	Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, Jian Shu <quic_jianshu@quicinc.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 12:15=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 8/24/26 1:35 PM, Albert Esteve wrote:
> > From: Ninad Naik <quic_ninanaik@quicinc.com>
> >
> > With the existing global mutex lock, there is a possibility that it
> > could resulty into a deadlock when SMCInvoke and smc call go to
> > firmware in the same order and both wait on same WAITQ in firmware.
>
> I think the commit message should be extended to better explain how
> that may happen (because presumably it did in  the real world)
>
> A Fixes tag may also be applicable here

Hi Konrad,

Sure, I will add more details for both this and the next patch in the
next version, along with the Fixes tag.

We triaged/ported the patches (see cover letter for their origin), but
I do not think we hit that specifically on our boards.

BR,
Albert

>
> Konrad
>

