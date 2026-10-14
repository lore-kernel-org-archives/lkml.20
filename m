Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9C2E1EFC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013484; cv=pass; b=cdusiEms3KoEic2xnpnAJEVq/dpbK2xPbBMkOnDNo9b9FCKJwPqSH4lRRhPnHMFwonzxfZfZXrGQUE4zQtIzdayGk1BdFGpGFj/Pc/ctswElEW9ezlkijWIpG9zdljtrkDrIkI0Nq5pU7RwNZIj3ZbTc6hGo3phCUq3JP9y8eTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013484; c=relaxed/simple;
	bh=N2//8YzpYh7RD5FH3/we2KabQEoyKWuwF8/BIhfoJs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw/Qp8RxZcEvj1dTilSW4zcGzFE01t9zLuBzWRH6JbXyebDRlsMF+oT3xF94Cdb5VU/Y963OshIcPZegtXmrpoioaBWVPyLkovZFevIU0QEbxE96RjaxlxaNcHpRYGuXIXFE2Fuw8gXiBD4m57VSDks/dEJCRclUT56x2tYIN9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cMid7/Ds; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cMid7/Ds"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5337c7b9937so2001cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013482; cv=none;
        d=google.com; s=arc-20260327;
        b=VBSTi+Ydnc8Uni0wvJZNmoI70+bspyuVO9hFA7tnI05uiB69cdMHED/gKclnP8vAIw
         FGyNLNzADKBLhdEfZvUXdbz978PG/vYdCAiL4vDdZEyNXbPdjH2niV3T+AXnUAnr/n42
         G27jmGjDJIvR0LcJBf5tmY1/Wj4ZCu0f5JBZBnu1B6LH+LyrezSY7u1qmKAoV2I8CXnD
         RbjfLUzwSUIcFSHQ+JrI0f2nHu5XC7kMH5TJRJShhu6MhmK0Fk6xbWsLnwmgOAD65XId
         XbiW7qobWbcMd5zUTiqxobCYqnZxqj3z1CtWdms3PETFxGvr9aCpIE4EFV3RAMNc1LeR
         35ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=salcn/4EyworpNRCKf3UMv4eLln63cK07XscTHdnYOY=;
        fh=ghB3TN0WS4+dYPb54rnsqKQf1Op6AaTe2zvimJ5UVaw=;
        b=pU8xE2EqFgR21CwNTp7GGTelfVrMwYxAyy275QyvLWxk6cMzKvEpQkKOpyMhk5Arui
         YdTfPKNrArichbWyp4IxNtThuI23Tr5KUH//RA03D2lNX+nEJcSuaD9+wFok13fK9O4c
         UEnU3OdtRBsVhmyMte/6qjjhCpiRy4/Zi8aOJbLwPhCVF8JG/uTOQc3wIO7f8Uwz0JED
         Edn8V55QFrLLjU2QniIhG/nkbGA0SNXS9r5YhJUtswLcRsTF5OfXbBqADnyxZwRr+q3p
         H48Hm39YxNJqQCQwYbxIdjEBdM5cnXe74YRF20EGTTJihQQY8GPMeFWJURsZQqraWZKC
         ZcXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792013482; x=1792618282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=salcn/4EyworpNRCKf3UMv4eLln63cK07XscTHdnYOY=;
        b=cMid7/DssrCMiK8QUyh+qtpdfZDZLxWE/hdQbsu4VGCyrF8YEWf+2x7X74e43rueBp
         KE7f8w7Q7Vi2M/o702mMnYIfANb2nuwBf91cXqZt6/gMzkgIQtfDnOc2FE2UbaWs5bow
         S85RcTh0ejfmQGGbiDNln5E30oQ7PG++cCWwvvS/aqshfLJAf3cBr75puKtojotINHRN
         6/NbcA0UPDn/T0T2+TvA9fCNL8nPDvbxNFq4lSP07zmpuYWELIbEjktvaPPgUSVGiFEv
         b1mMhSbVJTNm46IH8Ktmo4p5wTGQfGkFNiX/sI3y3mzSDOJBZV3guqdYjLLR5c0Qu071
         6GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013482; x=1792618282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=salcn/4EyworpNRCKf3UMv4eLln63cK07XscTHdnYOY=;
        b=og4NSPlCO+V7mbjTcl9Ho1yzF1gOwHK5zhm91S3cwdnnF41rD9/PuBQPzoV64tqlSt
         mkEXW9aFI3D9lTlOxcZFYSX7nlqCbX+S0eyd2bxZ1xzkebcE5BQ3XtYawmL5n1WA81tn
         ndhaFC++EctTbsSkZXKL8THna/5HaCy/Xp9PzfYk9GdlfIv7Ha1u/qRLbDnbcTeECyHS
         yXUsuPzZgv0IJfRbGtVv+lUsm5lCWdEQfhxaxRi5Jgpd1pdZgTJdtE9WwcRLPKCbEKY5
         eI9sXo1AXQrpFKRHv5EYu9kmyYuBgJKhQcLpMx2NNqqoB2mC7EAGas9mjgBwMsHQfX+u
         cwWw==
X-Forwarded-Encrypted: i=1; AKwUvBwE6X8XikS8KdDtwC5BmzN1DU+ZfCIlWvopSh7MNshLZvNfn++ifP04dpvcY3tSPyZGqkgRNXBPqyMMB8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXDoWNPFuscOUk2QwyI6nf7W4TuaAyBAsTiKvYeapDJ5ypeIhh
	bMYx3OxTtXevzN2BTWc7TXC6yZfAvabrDYkdVZfbXAPTYHvj7esv2TIPP4THUa4a3bZRZA02+WR
	NDvcR8b/3wfgPNqR7Kc0yCR86oPjn7jESiQmmQHm5
X-Gm-Gg: AYBFou0FzIGbB4Pt9Npr4Mt1melsHfTPyCqn89f9c91KKJVAvgdXJOBPlROvoOuueAw
	pbSTD+xXowOp9zqvUHwbx08hvTXy5CLS0Nu7ChpgH7JD7ea4GOYd8F8PseROMr2pMNW0un9UqxT
	4cd4CTji05IOrHvDkfGXOXxj3/BlDOQY3ctN+/tvApxit/pyPVhyYt1rfoJwlLV3pHLpZnxDlbj
	S2qJJlrJBGSrOyFUCtFm4dv1kTxkNLmT+mXnaVFr954M7ocsFbzBzbxpFsxIV5S8ck9oF4wogXF
	yYYa30+S+hhCwd7kNLHgkchlGrCxoG6KZ/YlcPsdft3KtBTCzYXjoEx0ZREJF9us3XBLAr5uc37
	fy6yY0VDmEQ==
X-Received: by 2002:a05:622a:1306:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-5361649aca9mr627821cf.1.1792013481394; Wed, 14 Oct 2026
 14:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008172208.1139281-1-scollyer@google.com> <as8slqeTjJYWOlaa@google.com>
In-Reply-To: <as8slqeTjJYWOlaa@google.com>
From: Scott Collyer <scollyer@google.com>
Date: Wed, 14 Oct 2026 14:30:45 -0700
X-Gm-Features: AclHuK9dTNy2V58Mvde2wiIYRycH3eWAjlKVw_MqF69XjxEhPGK5vsGbDkVBF58
Message-ID: <CALUcz=0LAVTML4GsrSvJ555Scr20v3b=t3Qs=E3Vm5yiZKBBVA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on EC_HOST_EVENT_PANIC
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When the EC crashes, the AP will be reset as you mentioned. There is a
slight benefit for the EC case with this change in that a controlled
shutdown of the AP gets triggered. But, the primary motivation for
this change is for ISH panic handling. When the ISH resets, there is
currently nothing in place to trigger an AP reboot, and this results
in the sensor stack getting out of sync. So when the ISH panics, we
need the AP to reboot as well.

On Wed, Oct 14, 2026 at 12:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Thu, Oct 08, 2026 at 10:22:08AM -0700, Scott Collyer wrote:
> > When an attached EC or ISH device reports an EC_HOST_EVENT_PANIC host
> > event, the EC/ISH subsystem has encountered a fatal exception.
> >
> > Handle the EC_HOST_EVENT_PANIC event by:
> > 1. Logging an emergency message (dev_emerg) with the device name.
> > 2. Calling the panic notifier chain (panic_notifier).
> > 3. Emitting a uevent (ERROR=3DPANIC) to userspace.
> > 4. Triggering kernel_restart("CrOS EC Panic") to cleanly restart the AP
> >    so that panic logs are preserved and collected by crash reporting
> >    services across reboot.
>
> If the EC crashed, wouldn't the AP be reset anyway?
