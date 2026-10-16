Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815B034041B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141933; cv=pass; b=Wdz5iuHhiP0K+pbdAVWmuVvk2EW3MiVKeBngjIcpkcAkmSVjwl2Ddxq1bcTMIDshXCZNjDp9lLM74m914B+QmTh0e9RD/Yv5MMmfRD1kSw6kXplOZKmqTVgspw4foZKK1F5+Zxa4PHieETtNsA6cpun2nT+6/zXeR0pgvMY2I1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141933; c=relaxed/simple;
	bh=4phRvFpHhegv43W7JKa3t8dLnLZvXANt5x2EEvNl+8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyxN97EM91R3niApBmqVkGOOFVUjH4aR0mQFDFy6Lu6inkJyCdD87kZ+7EYwfixGsiaGkzMyjvmBxBsi/RY5DfZAOyooAdCfFK9wC1ma9zovwMQwNsWeTJka4meCS8IHOg9EIDlqkAs5CqDUVnC9J5IozRSLt2K/nX9kkfupkcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hoUvwNiM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mz025evQ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hoUvwNiM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mz025evQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792141931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJJ41mm7nzuaQpGjKZP6QV+aCSoS6Gxyv7mNQIQLo5c=;
	b=hoUvwNiMRQ4RrGAH6SQFqTVZzJVTMOlhHNUyzXNN2+uuX9WESrCxiwkWQbeQ/3xB4jrfR0
	svg+3g0TLTC/JGUCli8k6r9X69sOALX5GGlgFPeNr6N/73YVWLvbOpZkJ19fnIy8woz3go
	Z/XY2g6NiIWX9TCEi6Sbnwy4RF0rfWk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-Xutw47ZcPlmbwWYJsmybtQ-1; Fri, 16 Oct 2026 09:12:09 +0000
X-MC-Unique: Xutw47ZcPlmbwWYJsmybtQ-1
X-Mimecast-MFC-AGG-ID: Xutw47ZcPlmbwWYJsmybtQ_1792141928
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b01a74792so4065773f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141928; cv=none;
        d=google.com; s=arc-20260327;
        b=o+2Pxt5kquF+tnqbMTVjREl2FW5tfxB6wUcuK1ztykNzLPSBKL2Ixnu6uz7UrjMMHE
         1FAP1zkz3fX/yqTRkLsYMjr8WRPmVb08bFqbdLVBMpqy20rmjO8krdC46Y+duNf7NEMP
         t4exXvkXzPJkKP/ql5ZLWunbgDCeglrWdDIDOnQFNb4XnvzoAiMjsazI1J2s4cUllVQJ
         cguTkBuY/+Jj6f2LIbdTZxF/3Fupt6NzTc7N4m0hzGUJ9jDiYGdzjr8XmjA0NG+YfcN7
         0kEWTZKaG4+GtUicNOJwTkwywcZhhr2eZjyMM0TV9VZW2V1MBShZqvxD8+SzinvBrYbQ
         7KGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJJ41mm7nzuaQpGjKZP6QV+aCSoS6Gxyv7mNQIQLo5c=;
        fh=rosRt8F360cnN7vnMG78g4xV8DkO5ENAEYIAW6FVnXw=;
        b=jkmnNcsNkj8aHgbjck1fN+saMB3JskchKwzGj6maQadt0peJZq/sphv2I90CAeP3QH
         KOQ0xnwedQa1toS+emxv0096IrWEQrggutFkklNbuH6RjgnMIrY7hnQ+julwEr3Am8+r
         U32sn4Vy6byp1sG08O5cfdOGaPFGEPi5RCF8GRpMDGupmsKmQVAleA+VENSpMycdY6NG
         v24u1DxhdtBp19PUYSOWNWjfOLRMGZxQUJh9HGOE+EAi4ZYdUGEaxfk26fupnc07cPIt
         sVF+DwEeTeF12+sASh1daLHALAT6wthLEj08ayZOB+omSZwUuNZlNUaaWUFEgeNjpzhn
         8tXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792141928; x=1792746728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJJ41mm7nzuaQpGjKZP6QV+aCSoS6Gxyv7mNQIQLo5c=;
        b=mz025evQkBaqzqgPS9qb0isFy5r3Ps6sh4cR7sUrqD/HVwBA9ifHCt6ZvLsV+ZYtic
         /PPGHl2iso/4RANiT1qzUfqZwR+rRUQ+fVl/K5FdeREC5F1vi4oi7Mqw6/E96BCbHt0y
         8xHQjjR6a+Qd1KGxX4758byaD/KvPEv9f/xqRDFj0CjfPGF7uRyriDOavTFoxX6eYg99
         5mgBKNCsYMm6oZkWup2jPwbh2mdaTi0e8cBm5lVm/rZx7EWmUYHFkxcPc3WLhFLsJbm8
         sH7iyWfpJbGHjy/OSIBoijFdXVuWPKmJXyThA4ArK9k1iNyVzJS/32f1niEQa6WOegc5
         3zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141928; x=1792746728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJJ41mm7nzuaQpGjKZP6QV+aCSoS6Gxyv7mNQIQLo5c=;
        b=Dv0AO8/ahSoKXfaYCP7oYGEcaiT/nbd6QyBPhMffDlqTHjbOA3vAQs7m3aeWSgvDZt
         TJ3U+6l0Mn33EeLDuYTUu8Oer2Uew9H0JYzs37PWQ/ogdzWENTkBU69Txduu4nDU4wx+
         h3reQUOhWqwybJMyYlyC9Okrx0nfiNdZGWeyYMn2KynibbhMRRfyqy1u8uhrkT0bUAC/
         hUdtxjF2wisZT1txjeVAqLlPSOS6RsJCy4qiWzbR3UbPzykBQC+WyKA61DJEu86/XGsh
         mryqC/hpQAuU/wFPMLcpCXfe3eQ644ZtkyBCKdPVJ+0587NPEO7KP1atHqAKBNXAzseg
         YU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuoWl+9+ecdD67MQkK+cO5qrcks29QC2o6TbrlQaQHGYm7e1S/cJ4kv9AWxJfIxNtuWb5MOx/VO144GuE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiymERRd+tkYEOWHIs7bWX1cD1erGVDmNO4OvCvTHXmW8W/Cnh
	OaFaVv18W/Gqz2QIb4PJ+gOtJVWAZNGpCAEdYwoGt0WVIStMoEj7m1fp38YUmA46ryEZJ6jPq3s
	oGRl6jylfI8VoNQ/+CYNseCC/hEQeVF5+AEGaQynjy9qBTUpuCWfVQdhTduO0wHVvEqAowmoZND
	25ZjJVrs6f7Of8gEh3/2ZJRHDRF9yEv6UsVSnELm75
X-Gm-Gg: AYBFou0Oy8E132hce/l8YvNPps7WDaT9bUp6vfb2Wg0TEK9MdHUDKQrO+WODhcD4dVd
	kSW7qT3ytdq3Ey6ZTazhJbIfTGIbeip3eclrvqNhqlDau7pwVuB7stCJ9RR7ueKWWEOr3M9NaC8
	xTTT63uHWu+GV+9HfYYxCBKNTEkWqpOfZlsUCTxPkX6PSDYyUZbXhcVAAo3B1WKAoDTMdo1zYsO
	ltsLa1MlimTB4xKtMzNYbdc1GmejEIoOp56Vh8N4JDB35OFlB5V3y4cCc2dPA==
X-Received: by 2002:a05:6000:4b0c:b0:48d:f3a5:4563 with SMTP id ffacd0b85a97d-48df3a5458fmr11200752f8f.20.1792141928250;
        Fri, 16 Oct 2026 02:12:08 -0700 (PDT)
X-Received: by 2002:a05:6000:4b0c:b0:48d:f3a5:4563 with SMTP id
 ffacd0b85a97d-48df3a5458fmr11200696f8f.20.1792141927682; Fri, 16 Oct 2026
 02:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016044415.958618-1-seanjc@google.com>
In-Reply-To: <20261016044415.958618-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 16 Oct 2026 11:11:55 +0200
X-Gm-Features: AclHuK9WZ26zN9lSzbCdIOrScFxTk9_YmWZKtqGI-UaxpTJBYIJrmsnce1N66a8
Message-ID: <CABgObfbm6KA_m-C9fCW+k7zca9OUFaAhw6=1u0pFuQGEfXXfCw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: x86: Pull requests for 7.4
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:44=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> This cycle is "fun", only the "mmu" and "svm" requests escaped without a =
conflict
> or some other notable mess.  That said, I don't think there's anything pa=
rticularly
> thorny to deal with, just a lot of minor stuff.  Details in the individua=
l pull
> requests.
>
> My apologies for not getting the guest_memfd in-place conversion changes =
sent
> along sooner.  I really wanted to get you a pull request around 7.3-rc4, =
but we
> simply could get the code ready in time.

Pulled all, thanks (for now to kvm/queue). Even if it was a bit messy,
part of it was due to more than the usual amount of changes in 7.3.

Paolo

