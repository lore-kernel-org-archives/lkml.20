Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018669;
	b=yr3zwOMzlhbI03z3rG0wTftsNgkFVrAiCIqdsHmPoh7LCcTfsciHsK2ilk1APJNhwDqp
	 qsojNvdi20GY1T1fhKVq40N/smqknhup6vgm+jg6YR0zh/dVrH6RF23HIRtuZnjPOWkf+
	 yuVJrXZyfDMascS4eEHf6KROoIdlbNLowMIEvUwM5DZtCTs2cnw8WIafdobJ0TWmyeyGe
	 T7Uk2l6ad1QT+Hy6vx5WepCOsAHpFfJYrVRiFp/lz/e08vX5SjAAeAm4GzeNARYQWL/bl
	 3CKr1x+cNeVt7t7C+vbuGwR0ld5y30HNVXpY1IeeWXKL3LTcFKiIqKbT6u4qRujfQrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018669;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=+Wq76IOoqC9Xs53xPZFbGa8lUXZBI88ZO79pfXsG86A=;
	b=g7u7S1S0ueL7XkaMlk7DHCjXLkBp0RIaJN1FYnYDOlI8qTgyg7IYFeCxgI0qvwaEOVLa
	 vUS2b2qTK3slDWHRzqNPq9958+HE08eAaM7yL1RcyADODmHSUrHc5i2f5q7JGuuieXuQu
	 HSoynr1joQvhoy0AKO1YoROA3DayXSTcelmqa3pQxGm1zkL867CTx+gtO0inYwcdSFs6T
	 O8ne/DXaxIatqayImDfNB75SmKMoYCvo+pkBAgNCWmUpfgYorz2fBDvrtxivvT2hT1qdn
	 6Y471kFZBZWuFRxj7jj6hmABsh8XNQdkIC7zuGKNuObHpInqh4dZA30kFDGc75lqwcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NILu7kjf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JqSj1Kw7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15961606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15961606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NILu7kjf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JqSj1Kw7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793018668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Wq76IOoqC9Xs53xPZFbGa8lUXZBI88ZO79pfXsG86A=;
	b=NILu7kjfL3DtN8jfwCEWfd65DzzHvECYIWOFer2qqC27qlWEbTAVgq9Pq7jWrzYi/WcECk
	EED6Rs6JBu/sSLG+Yj/mT5Mb71Sfen9gtrdDGHRZfyChQ0UyiLgnSZCnR8j1KnfNzNwQIZ
	JHMGSqUTbe/SXdG+KBUPfRbwnEDFpwY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-X7spw3h1PeWUHBJfytMhrQ-1; Mon, 26 Oct 2026 08:44:26 -0400
X-MC-Unique: X7spw3h1PeWUHBJfytMhrQ-1
X-Mimecast-MFC-AGG-ID: X7spw3h1PeWUHBJfytMhrQ_1793018666
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-537548d4bc0so78670641cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793018666; x=1793623466; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Wq76IOoqC9Xs53xPZFbGa8lUXZBI88ZO79pfXsG86A=;
        b=JqSj1Kw7P+a4kQQ3sVuHoaKXaciUwav2HfMVrw9DryU1sm/MM9uQ7gZce1tZEbwmON
         cuBFEeJ4Wor6J2hWEVxZ5+a/lMQ0WqjhalBONLnLzDKaE3LLyWS8CiOPpu7Zrh0cAzNC
         CITjrznqmgMLv03evOgYekovttGwYwd8LUb5dbsaI95ZlQVGXSuOuodSlbGW5wkzP0Lm
         3yuu18LGe06xEn5fHMMfhHQ1pDKXRla0cdsqs7h/SEutvMY8mLcyZr+Nobwo3AW8ipUb
         tX/9a5tnscbtfdR4nwaVHrWJlsoWTt03NWn8vmAjv0ALrqsUm8zrfi3gcCWZmH17yb3X
         hQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018666; x=1793623466;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Wq76IOoqC9Xs53xPZFbGa8lUXZBI88ZO79pfXsG86A=;
        b=IrQX4LSTgSUjX8+3wnFz573djk5eG5eM9oJkgIorq8VWKUSwOnYd7VRsWlJIOzQjJn
         XwaIKon1ypb8/9tE9tyF+857ZMNinPBcpp9jbHVO1A/b2DfHhMK7594HQ3gov9z09ghA
         01miAQAnE+vc04r3+y2O5m2BJo5NvM9qB/AcCvLZmVP4kOUNyN3UYKvX0Rgdq0JXsUA+
         uFMB/HQksdKTLdxNWh2iNWlMCEPqPqgrVvrX+8MBMvjjLdUo24h5zCCQ8ZN4QkgauwmZ
         MfUfc9DJYBM3n8CTgf+q0ILja7szTFZR0PT36bBEYynTL5WfO3n/Yot31749opUrsSOc
         A1lg==
X-Forwarded-Encrypted: i=1; AKwUvBx2mAmfyTUgJSL02jE1xJ2/+mJ1+ofJS4gY9g2buH6MPSKgc5C1kCQwGOnBi8g+ROlsGy+NQAgrbf8jspo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI12Ic/qtptBNtsWEyBiW/OxCEsdTbceOU3JfZLclRmOHloKkI+
	TRzQQLf6VttzGdfU7siXyHdhM+5Kerz7QtS9/Du3VounDzZ6+CN1EudhfE9rdEA7j+r71lih+Qx
	wMS3vW9ORfD9BEQkxfbxwN2ZxEHFV0/yR1Ivs8kYcQcufm5E9s0ynlw2NO9Ti88ElbQ==
X-Gm-Gg: AYBFou1qGE4RXlD5aG2+8p04n6zNdWu2AA4f9XqWt2IHyJsKvRTmS7GQtZRmXvJvhXB
	euV3ym3sjovHyFCgD2jZevxkQrrzy97GJfK25V4JrHQBq1orSCwYP4s6zuKSZIuC7byovn+XIhy
	QG/PMKDtABuFjrQ7VwYM3dB0fAfhELzEIy4ZogjWJ5S/9EpiLzZsU1BVkLsk/akt5QjAPBzvWui
	Ubts2k7DTDdyoLfI8HTQ8IPDcw6BqrRBtdO6DWujitjSXyRPrMiSQ1eoz68Crxbh1UUx36WHCkw
	1Qqb29CkjjceC8RaKq+0qXlirNCeNdFrZuHbil2Xl1ftl7bVCsID7jY3WOT5tzFzKF8aeuieNnU
	8U7i+DwP+fm8pCnXeYPaOqHtc/QUAz0hU4nUFw0USYJ5p0zxnXKEB2fRYR5DaKYHEHv0OO961eh
	Li8DvIfQbqfjGGNRzAHZT73w==
X-Received: by 2002:a05:622a:578e:b0:537:d4b4:3617 with SMTP id d75a77b69052e-5383b36f9c1mr95685791cf.6.1793018666212;
        Mon, 26 Oct 2026 05:44:26 -0700 (PDT)
X-Received: by 2002:a05:622a:578e:b0:537:d4b4:3617 with SMTP id d75a77b69052e-5383b36f9c1mr95685281cf.6.1793018665567;
        Mon, 26 Oct 2026 05:44:25 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm53606071cf.13.2026.10.26.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:44:24 -0700 (PDT)
Message-ID: <bcf0cd314f3c4f061a02c802f0ea9ec4b6e25cff.camel@redhat.com>
Subject: Re: [PATCH v2 0/2] scsi: target: iscsi: fix stalled aborted WRITE
 commands
From: Laurence Oberman <loberman@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>, mkp@kernel.org
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	mlombard@redhat.com, michael.christie@oracle.com,
 linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 08:44:23 -0400
In-Reply-To: <8a702a89-ad21-425e-9850-d9771fcf7c31@acm.org>
References: <20261016175351.126373-1-loberman@redhat.com>
	 <60cf407142a0663a811a2ccd64cf387cb71808ab.camel@redhat.com>
	 <8a702a89-ad21-425e-9850-d9771fcf7c31@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-10-25 at 09:40 -0700, Bart Van Assche wrote:
> On 10/25/26 7:43 AM, Laurence Oberman wrote:
> > Gentle ping:
> Please take a look at the attached review report. The report has been
> generated by an LLM. As known LLMs may make mistakes.
>=20
> Bart.

Hello Bart,
Thank you very much for using your LLM review this. I am following up
with a v3.

The report was right about the one thing: the claim in v2 did not cover
every site that completes an aborted WRITE_PENDING command, and my
answer to the Sashiko review wrongly assumed=20
iscsit_check_dataout_hdr() checked it. The upcoming v3 adds patch 3 for
that site and patch 4 for the DATAOUT_SEND_TO_TRANSPORT path, and the
cover letter corrects the Sashiko answer. The comment reword and the
patch 2 commit-message cleanup are in there too.

Two things in the report are not correct, in case the same tool is used
again:

d5869dae5080 is not confined to 7.3/scsi-staging:

  $ git tag --contains d5869dae5080
  mkp-scsi-fixes
  mkp-scsi-staging
  v7.3
  v7.3-rc2
  ... v7.3-rc7

It went in via mkp-scsi-fixes during the 7.3 cycle, it is in released
v7.3, it carries CVE-2026-97951, and it is in 5.10.y, 5.15.y, 6.1.y,
6.6.y, 6.12.y, 6.18.y and 7.2.y. That does not change the conclusion
that the gap belongs in this series, but it is why patch 3 has Cc:
stable, and why it may be better taken standalone for those branches,
none of which carry patch 1's helper.

It seems aaa00cc93c1d is yours from git history.

  $ git show --no-patch --format=3D'%an <%ae> %ad' aaa00cc93c1d
  Bart Van Assche <bvanassche@acm.org> Tue Nov 27 15:52:02 2018 -0800

It is the right Fixes: for patch 1, though, and patch 1 now carries it.
git log -L on that hunk shows your commit replaced a
transport_check_aborted_status() call -- which sent the delayed
TASK_ABORTED status -- with a bare CMD_T_ABORTED test and a return.
That works where the core can finish the command itself, but a WRITE
still in TRANSPORT_WRITE_PENDING has never reached the backend, so the
core's abort path is itself waiting in target_put_cmd_and_wait() for
the fabric. The other three commits touching that hunk since 2011 are
cosmetic.

Thank you
Laurence

