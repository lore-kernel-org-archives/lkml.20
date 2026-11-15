Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767297;
	b=YlT3Zx/keJp5aXim6FS7DlhuovXi4aSRChoq9sXl8Slf2xW4dJhTsleGkDsPFPxLtGEG
	 dVkkAqJpDRxI8mITTNwwJf2BxCuxfUEPZf1bgVxL0Gv4wfCM9zkgru4uNCbmrbzXAxWq1
	 CJ6WiMiJ/rvrs0t1UrLhv0CLgnx+srP839iW2i+h2NDyUNLkR0oD6dpi1ZCMAG+314upa
	 CxrkVQKwEoMCrPYhipNdT3v8Jb3Hn73dS1YDtFqMpHo1pDk0CKZBdiYSyQGGbe1jkWi7v
	 zQo4J6YXpxMOZGQGDnDLnZPCD2NoQ/BepLk1GTIx7DgdtNr5qNWNbll1i4Evw7ZI6ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=S2sqyuT4GDnGp9+dHpDjnGTvZCe15TFZq/xtAkotKkE=;
	b=1h5KZI4f1tKhrGkknWGJZ4LZgafTpfXVGnVbhuPZxO1PCawh50ewNInhWP5qvt69iszv
	 wtd2RXLaPBJjBcFMG8tUFl7suqUwLJPWOE2e/FLYL13ZzmyLaj6HfIQQoZkIkdMuSHyyY
	 QhgpiwZ0Qn3pfzLlIIr3rgWkt/dWCqVnHc+jWFEYPoB+3SN8ttSno+HmOp5Fr0S3JaWMn
	 9Po19tHEFWtobfkzk9uuVoXKRCAcaIH7sLtMStqWyPChUex9wm3F20mEQiBSjHmu/Igwx
	 E9Orp3MkBSM6ZND8e5FlWRZwg86vHPsrKZH6KNLYQ1+eTZAMQq/Sc05n98sOUTqZs9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBV5nxYv;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE19606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE19606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBV5nxYv
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1253074b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794767296; x=1795372096; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2sqyuT4GDnGp9+dHpDjnGTvZCe15TFZq/xtAkotKkE=;
        b=HBV5nxYvdpLlRvsxsYLbFKr5P34f8mj9a/XJil7dVolrFQomVVkyecHxP6BgFGwDxs
         /19GzczoyqLC7fuxmwJyN2rwUymD2CerKLMnjfS/2CRMvt+ynLs5gkxwuVBuAu3q9J20
         IzB2wBplZLjMFwEGGW7prCWCSa7Aywa/5h22qXYWy2au5OKH6AKODohFFnhhSeGrFYHI
         n+FqPiDDYHHddi3JAW7aghC+X3tcMJhczYrIX5Hp62B1gpJjhhKWZLANouBkWkfFg5wA
         r6zaGmjBjVlFtwZxS8OaoxZbnmYU5uIROK1UqsDLBtdOM41dsZCnP9Jsrl/zETDD4H/q
         kP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794767296; x=1795372096;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2sqyuT4GDnGp9+dHpDjnGTvZCe15TFZq/xtAkotKkE=;
        b=FMi/Vy6XGmgwW+NsbXsd3H8W8q6V4Hw1/+FKMq1VKuUZPMdSWwp5E1yEvMeZXJ5B+9
         TSJja/lyAG3jJ7UUUrUZDgg/YRlTMuGWO04xGfafdSFMqRnpWtHiU6SzyPdTHVLjynJ9
         5jrl7DoIAgTUb5OIYMogvAPvCQYNaXS4CKNEJ3fZ5RfDifPeUuaEtTFVKTmTvT2n/fui
         vPiI3dKl48ho987uGM+AdYJTNHElnctn4MRDfCytblYIvg72nOJFLr7JxYlBSWgb11/v
         JUWV39vJgAQZ09rxbM9ut2J5RYJi2JxVdKMvJjIotuY9L5aKj8EMqXG5anHwhF8ACeTZ
         swGQ==
X-Forwarded-Encrypted: i=1; AL+hErEYZ/wgTtWtP9qXcmN4WiC1Oa+L7ZqtdGnWfNErvDqwg3ez1PiWpWE+K0EQ/iczJRWmHmaoInx9oSZfUOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88D+Am85LuEUt1GjbsvId6Fe90M1tokf1Q+NGH9d1MpvfGFFSu
	qguFieDXGzmDAtI/7+Pqvb2EEceHCZFvqDowlTzWL/RSnQk9IayH2nlj
X-Gm-Gg: AYBFou3ZWg66mrAO60XQxYWHGFOxhYv9taLfiesoIL0fAvg8SjSAN8usVG5b3CaKP68
	10XuwEcFb/O7793VSSwK4vzNkoKdMsOEjJHpSelstknqlbFZlO32j4p+iHL9gLBL5AtzulvkGLG
	k0XTgrHOP5lYWB/vKKBEguA+XKxuDIbzrLW+qavxI4l44uPh/s1ZOwHS6rXFfqu8a9WltxJsWFS
	qsse8KnNo8UGJOImkG+JQDo7JMJRazBdP/R+CNpDYn9fIixS7jM3EPL8s14EoZOO+h4PuGL5qww
	1BAXsUSbVeorP6kbdQyQaprFFjRZc8/db4TNoXz6AuRgQiAYTa6WX7yeTIZHqEP+0d1pHMXp36k
	C4FuB/v/lDVzBzEViXMOqWGAovD9LMq2/xxPgqM2bvZMztG21/o/4KezxJrHXAqXGH3kI7uHXi0
	DJ4C+bYLYrk/vz22wWXuBmXKoRVzFONQwoR7G1LmuX0nofklapRpHgmpm8XrWB9S7Dep7EXNUC3
	PcfLf1hahp2GA0YFqe7zkRmBKCznTOr23gf+tFUagu1/4nsjXasiDhuS/H+4T+X8N+TChvsbwaU
	tzr3VWvlrmAKjJp7+lOwFkUgWb8gdgYyrGv8Xdu+Jd2Tw086KOjBD/RC36bz8Ulq1xrCowgMp86
	N2qOFk1Pa0wDQHE+7pUXOnGNhJeujNC76pQ==
X-Received: by 2002:a05:6a00:230c:b0:89f:d620:226 with SMTP id d2e1a72fcca58-8beb619bec4mr7100607b3a.24.1794767295502;
        Sun, 15 Nov 2026 10:28:15 -0800 (PST)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcce6bsm2804318b3a.1.2026.11.15.10.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 10:28:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 18:28:14 +0000
Message-Id: <DMVZWOMFDBX6.3HVETC9L8RUEU@gmail.com>
To: "Christian Brauner" <brauner@kernel.org>, "Amir Goldstein"
 <amir73il@gmail.com>, <linux-fsdevel@vger.kernel.org>
Cc: "Chris Down" <chris@chrisdown.name>, "Miklos Szeredi"
 <mszeredi@redhat.com>, <linux-unionfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>, <linux-mm@kvack.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 00/13] fs: let d_real() fail
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261115-work-ovl-d_real-v1-0-ca155efbcb2e@kernel.org>
References: <20261115-work-ovl-d_real-v1-0-ca155efbcb2e@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 15, 2026 at 06:01 AM Christian Brauner <brauner@kernel.org> wrote:
> As Amir pointed out the correct fix is to teach the callers to deal with
> an error. So d_real() may now fail for D_REAL_DATA and all callers
> handle it: uprobes fail when they're created, IMA treats it like failing
> to hash the file, IPE denies and the bpf kfunc returns NULL. Then
> d_real_inode() goes away so nobody can ignore the error again. The first
> patch only drops the WARN.

For bpf bits:
Acked-by: Alexei Starovoitov <ast@kernel.org>
