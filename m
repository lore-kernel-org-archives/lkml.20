Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517A3E40ED
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341387; cv=pass; b=HFmO2UDErpo+2hs4+LHHY+tw2BKSbyY7VIDM3QtwX97jxM1roW8jhE13+VsOI/n0mFWSg3VHpjS2mFW2/MyPi4iMVe8tsu1NEqvqBms8r44V9K6cTp/eKAEQHBUi+nJadCBsMh0w+s7rNkoEK42xKVbSNfS2GTPi4DDQUgyPu1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341387; c=relaxed/simple;
	bh=FPLZ0Gea9hz/JSRmqm8+Yl9PbAcCBUg55ctbtcIK6Dc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cuJrVA3EtcFOsQH5NZwtP9DT/wFTT0qdBxVjHNkztKlPFCtCYWfc3fGU9OU6uEe/EagLWAjpEMD9qRv/lnKlQQREZSzmRIQLgsvD8zGkiXAq6QTSOFzZvDTIMwSNWQeimleXRK9YOQxRfNKJbtLhUBDLTGbKqbqz3XaQb9dxpUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBuWlXbe; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBuWlXbe"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so1563333c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792341376; cv=none;
        d=google.com; s=arc-20260327;
        b=lFForAK4QeAtxuaoWnnkiyEKPBxZqthfhC44Psc71BBqi6g35c9vCO7kc5BpVngfG3
         F+pe7vm4B71gAfWnY8g0yT+oZCR/1VrwIA1tjmHgSrQAv2/5fx7ejHqY0CEyoW4rI4AR
         Jg8caQq0y/bnyZ8rhLQk1dzJo97URQuJsi3qaC+4xH99BW75edb4FIHgfXAoA/QFel2H
         C0yYPdgyUo0y0LyAwH00T3Y4MQAw6PIdQQFXmcqUb3r/fV6yyh5g+NFK1dYEoPcDNbyk
         gisUUyKm4uAeWCFzlvgZMkNdMWhe0VAaii9WXQUqBaiJOCXkO8SBK8LTHOb5sf9P+Znc
         IBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uSBn8urtnG85DeyPZbiYm19GCTTJWBfHm2XDZcJUMBQ=;
        fh=XX6VyQdZPATixU90F8MzE1NHCWWz/30mk0V1UqLwMps=;
        b=QstAEZov+GRuiaD0SfaJK+AFN+IVFMP3uzKO8kTeoSWszjeayIRMbNLCOqV8AZaUIL
         VD+Gf6qkYYCWIBx/ae/NQAHex+We+T9Q0Y0gpklwr4WBWMzzD+qGOo5nG419ockWKhxo
         gJGFY1d4hxY8dTR4W3w1qJbO+rMJFz/vXhW9IToQtaHRm6+xnBCvmzaKKxbDv0dqEeoV
         GvP8tZ8YrADxywBpbEdS2qvE+MKmDsSaSmed0ez6Vsc+5CrfQ14VLR2KB/C+p84zzudR
         SVYMynwLWoSzMRWJZ4T60wK2keu1in/Unm4rko+U6ML20ui16wf7dNa+0hSW8w5sQNzf
         lvfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341376; x=1792946176; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSBn8urtnG85DeyPZbiYm19GCTTJWBfHm2XDZcJUMBQ=;
        b=WBuWlXbeEq88koZDEL5fB4FSUEZ/4PqpO6AczKGAz4UodFNP3qoEMVfHKaAfBaiz/w
         3x7KXRqbK8iUOTALZ46eQbaTlC5AlVaidF3tbk67Kl7amtFMgePOLNEtAPFSp2qeexQm
         qzg8R3KxDd+LrXKKunDW+07VE9NexDMVfK3vIgbBMTobq0UWY97WGbm7kwp+n2u3WO6k
         ofRKF5ycDvVuhOus68B+RdYL9/hOYBl06BFOLNOH6IWVJwqO1tIWG/hqC5fmxcka8oD7
         /LKR3ccBkP98TmXvp/XGx34vDhKc/t60ew56uOljWSaCWKHkHjeyoitOUyeFMn5HGkAB
         ecKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341376; x=1792946176;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uSBn8urtnG85DeyPZbiYm19GCTTJWBfHm2XDZcJUMBQ=;
        b=2MW0llb5pWKWvEWwVm70FHGcb6SCvRGXc04ViV5XFfRaFRoP7SvJLNTfvNJm7mqFsW
         ZVZSkuZW4/iGjpenUKQEwSd6oMhN9OnF5+EhxfFh/+aBuOBow8AmoOHbWTZQK3phNFX+
         WIZk0EzfeRsvJBJts6uO67WCrxPiwxUUJ/B9GrTVza3T+ZjW4/tjCo00nRj2dTsfDahD
         A42/jyGmdqLtkGKOI7lSwBZNKYeRDC15J5VslISv8VKnBJhPRgKR6ykejALy+zeYO908
         WEGgzmGxiPsIC5xvwWAENrjxK4Aw417E99IusPFS8xKZkiGcCOX2pRgsyzMntfZoMRoa
         S7bQ==
X-Gm-Message-State: AFq9FYLrCnMbXsUjDKTXNcH/kzSpJW/DAkbTzWbm+OJxH1CnE6FQVDQ/
	+wqAdV8Fl6AeW4pwPf7Yt1591pYlqPwzW+86TaLlwAW15t29kPUe5XBf5JSogZPBcbtZLd1MJMQ
	HyQFCDOqju+5vNTk9fxlGRYWgDEKpOx0=
X-Gm-Gg: AYBFou2B0LZ5o8DDR2dvFEhJEiPynIi67l7t4jdUwO83w2ImQUb9NXYnmIHAmWx8RiJ
	eYIhdErZ9Yt0xtUKf1/gZfVff783Q3vLfH72BU0SmiiNo9V1IbnExmoT8G0//7UQA/Bb7y6SnSv
	gEpKgt/usGYYqTaJ0JcPMP/fdJEssOC7C+oMWCn0J3Xgg7FimbogQ1UKHwL5quT7A2ahQsbC43z
	28laR2Wzav7iRhs6G0yCx5BYW86bARYlR6g8VgJrUzU+c6z5bzYbhCAc4+hZF0ow654OEiwJI6o
	aFHE460Eed4AuD4FNjh/en6SBac1CdXLKJWXNnRHliQLyf1rRc4JtQGSLRx5NWYzYLxQchApji4
	OczCTwPN8G/DcMPBeB01B1xfWxlxWx0GZSO9xlrrQeX+jqWzjwkkmiPLjtVE+QPMji5FVXTJmFY
	6lELsHFO2cRwA=
X-Received: by 2002:a05:7022:118:b0:166:29a2:f83f with SMTP id
 a92af1059eb24-1850c5f8128mr12785809c88.5.1792341375837; Sun, 18 Oct 2026
 09:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Sun, 18 Oct 2026 18:36:04 +0200
X-Gm-Features: AclHuK-wxXorEEYCWGPNP2gvIDjNSEL39qVBOA3obzMzh_QZBSjRBFUZs9UouvI
Message-ID: <CAAUqJDt1pXQ2KVBvMoMiDrzz8ishonqhQ0nnQLEppot4nmv9Bw@mail.gmail.com>
Subject: BUG: selinux-testsuite binder tests fail with CONFIG_ANDROID_BINDER_IPC_RUST=y
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Android binder maintainers,

Fedora Linux has recently enabled CONFIG_ANDROID_BINDER_IPC_RUST [1],
which turns out to cause the binder tests of selinux-testsuite [2] to
fail.

Minimal reproducer (no SELinux involved):
# git clone https://github.com/SELinuxProject/selinux-testsuite
# cd selinux-testsuite/tests/binder
# make
# ./init_binder.sh
# setenforce 0   ### <-- may be needed if SELinux is enabled
# ./manager -n &
# sleep 1
# ./service_provider -n &
# sleep 1
# ./client -n -c -r 3
Client ioctl BINDER_WRITE_READ error: Invalid argument
#

With only CONFIG_ANDROID_BINDER_IPC=y the last command succeeds.

The issue reproduces even on a kernel compiled from commit
eafedbc7c050, so it seems to date back to the origin of the Rust
implementation. I'm not sure if it's a bug in the new kernel code or
some bug/wrong assumption in the testsuite code - can you please look
into it?

Thanks,
Ondrej

[1] https://gitlab.com/cki-project/kernel-ark/-/commit/c12a0ae360f154fcffc0dd72381550391f77793c
[2] https://github.com/SELinuxProject/selinux-testsuite
