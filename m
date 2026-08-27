Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88D3D1CB5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870236; cv=pass; b=eSBOgoLEnag0+SONehbVPkS3cFcZ0XsXKMqq1aOK/gr0jRacPRgSm6OA/ixCC/xFevllCXl1sgjNyWEyXIPhAvNt3gBWEEz3BjPubGgE9ppf0Px/whPq7vnt2hR5lyQ0QLliB0zthyYt11PCODg1tJUHnufJy3n+MGIMchRbfOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870236; c=relaxed/simple;
	bh=1FhNBn8HrrMBGExkBgk6a5QrDZ+d7pHay6JYHWvqv+A=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=GK6FwETYaij3xVK4vwpE82Z9KoRGhqsbQuXTeLQI6RCp2rT4kRDDchdFH3bkzJuKAxEtkiY7mIuDS+GqpHibeTaqjN59Rmb6u2LZBMYrfzLd2wUuSjyfonPH+Qa5NdjKmxDVUCcNRCm1ANdeYAyhD+2IirSSLf8TKmgbK2xC3Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=hS6EIzLj; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="hS6EIzLj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d049069377so4890125ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787870233; cv=none;
        d=google.com; s=arc-20260327;
        b=QGk+eiiAT3wouezVjueDGOtx5GTXVI1i9H1W35zFlDBFe2hsoi5uYu70TEeG8WWDkG
         lGYdreFe9+UyYIXhbIDpQnBpiPAofNBc0CpyNaNj8n697VY4OJVlcWxIFjcPgYyXPD7s
         4738gnDP/Ye6RQtGiaMpZw9Si6qZmrGWdyQAsCWORuVThj7UfWpJD5KMK6ex4nZS07Ww
         nQnqFgQUms8LFxjrW1GTaYAJnbQr+3/RDGB7NlcdKG0xDF6C+DweSggIoqgmAKU4Xnkg
         s+QbgUzdV4dpoKos07P+Xp6DdIA1GCKf3qCKiEaUZuRBjmK+pcYmQkkjSRW8ZBNXq9Af
         l2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Eq1s1DNfITBZf3cFRPXUrAig9Rh05gskqzjYAwCiF30=;
        fh=eGpXyGueeC4fHWIiTTBvBHpDeU7NyTF5lFWs1xQm0t0=;
        b=FiKrwccx34C6aMdbyxM24AwsybCa3o4Yxifgyeba5E0w3mgiQSd3zV10MsocziiOER
         +/urE8CcRkOtpcV4+AMHn5Jy386R4vAtap2ir5eC5V+0jUxsO7z7l3e4IiYVQRl4Dl/o
         qvg7cGb40gg5Yqpp+Kp5hw4JYKGjMyRRgIp5iFnv2jYEnNfoeqSvXpGsTJZ8vMbIQGTA
         m8NRBKfEW3doRto7S4sYPwXs7xKdLPH8rXn0a/mgx8C+PXpeaPsoHrLrkQsj4bPeBmnU
         sS04LSNOsNy97QW3SUxO0k4VGw9tOx6/suiDiqxDZsbqyqlt07g2YG0KGbg84MEw4+yU
         Fz5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787870233; x=1788475033; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eq1s1DNfITBZf3cFRPXUrAig9Rh05gskqzjYAwCiF30=;
        b=hS6EIzLjf0xmX7unGVDgkAxPMdnrZEkVVlxAdUgNIKnxTXXWqie8boWuNY0iN44Vyt
         UP2GNn26JxgwqVst/xwZ+OmwnqUMb/8litzTEKcoIhd3VkIPALYTw6C6aFbFPo9oZyUt
         LtrM2AwTPS+EPLUA64qvYnpLKzNnEKT0itJvAAEkM/LDHKaiOK8XtEwhmj1T8lKByetA
         6FG51jTJk+MRpXmASPOrqjcivLevEEnlF3BQINomu1mbRv8oBl1e8aoklPJXRPSncs+S
         txzlqJoYHIRUsNqiyWnizPxoSoOPKc4UJNUfIDD+18l8J5HqzXySDgEW4oITV4WYJ8/p
         ZoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870233; x=1788475033;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eq1s1DNfITBZf3cFRPXUrAig9Rh05gskqzjYAwCiF30=;
        b=IhTmcdCGE2dXiIRKWkWWb6cUPO3h97ZWW8S3Gr1bJbVLierj6XfJpgT0zAzs5XgNWd
         PpsW2QAx7i1rWjoFvu8P0GhBr1UiXe9X/p8aOuwJ4CN9D+ovUIa5CGm7lfJiJKeIUN0M
         5ePakkERhX5WRKrc0rHp9Kd339d+iIMnRQXOym5Zwi+Koi3iq6gOEtj6kP8jum9BPby7
         8VO836D6RoPKrRg8crgzMMQgtEThwovHdTnM2zIqB3qLVokvjtfi0umuMi4I045A2aLc
         rqo9sJgzKORpr4uhFrlIAdx5Aoa23ZkFPbc1H4UVXxlYrbbZ54OeVKu9ncL4NRYEzl/z
         fmCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfrSoLKJbmOxplyb6eifYSKw9GjvydknaC0G9l7Ke4X93M8o7xTjDt3CSaiZPucjdeyOWjT9RWAOFz1dw=@vger.kernel.org
X-Gm-Message-State: AFuF++lKRiARUv9NwWyxH5S82r4WfpUfqfLsqPEXFWDFXRI0CToZqag+
	3oQmtM8jS7uhxhsfoJpyFSdRBK/AEC6JOZ3TGsc2lKDbPTr8fqvA+e/lBVp3MRD1dOa/bi+zkCs
	ySDlFp3avmtUrrkV/nOFSWk6LUAyNLZvWDn7hQXVw
X-Gm-Gg: AR+sD13ihYKTFSccGHY+Yb+rGbi+Jibelu3u46JFB1P7CuNjYi8zxGZCO5iRFCbyV7H
	dDHgHeQAqDRKEwDRczQV8B8vEb6t/dzx0xpC+jYyg9SdBsLvukcVaScii1uZi1rp+7x0QeSMiO2
	ZYwM48iB8wjm50xJ/J5zzLgxBH+LrEGWn5yqhI0U3waw6JAq/1QIKYAKUZqUjahAlPJdtwy2epn
	L6e1fV+ARHKEVn+EdElXwkWUeaadMH/7S4rrQC7ZNVYooSDOQmoeG9HP2DOtvV5SaapnKv78zbS
	4gx66Y9fRmEXXRTDuxR54S0XXc7oWSC5XdBJy5ojOu8F58V4GQlRdyMElVc6BBMDHUp+7IF8BoV
	be/fsac6eRKdEMMWckqr/PiVkYwxjZLwl
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id
 d9443c01a7336-2d74df0328amr45719285ad.12.1787870232038; Thu, 27 Aug 2026
 15:37:12 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:37:11 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 15:37:11 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 15:37:11 -0700
X-Gm-Features: AcwNN1XF0MbNniQ-xu220utGY2uYs2iV5RziNHwgcfgQ77-EEwG7ldgQL6XT9tE
Message-ID: <CA+0ovChcGF2nsf0iJNGXM79iGv2fKEqYi4DGQ55aygBcKg2NGQ@mail.gmail.com>
Subject: [BUG] afs: ERR_PTR dereference in afs_lookup_server() error path
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: falemi@asu.edu, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello David and Marc,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/104-afs-err_ptr-deref-afs_put_addrlist/

  BUG: unable to handle page fault for address: ffffffffffffff9f
  RIP: 0010:afs_put_addrlist+0x43/0x250 fs/afs/addr_list.c:38
  afs_lookup_server+0xd3f/0x1020 fs/afs/server.c:243
  afs_alloc_server_list+0x800/0x11a0 fs/afs/server_list.c:82
  afs_create_volume+0x995/0x1290 fs/afs/volume.c:227
  afs_get_tree+0x955/0x10b0 fs/afs/super.c:555

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
