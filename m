Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97746D093
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196760; cv=pass; b=WeGcAMqyHwFUYLh38A3ukd5ZEg00nfCllY2Nv89XkS6RqQYTrLKddMi3zc2ZZdZ02FBz3q7oYXTfwePuuA39yL3p4rmXDwTJ6gybYgVNB3ifSmOWMgQlLzR4+2nNPOs0mEj0w57VUJT0oJk+BBYVX6fE1YriWTO58OjZ2TMYz/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196760; c=relaxed/simple;
	bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RE2LdbnqlKu3TUEDLPQZeSUdyh7tBWn+phfg2YzurL5ZB5CyXm+KklGIEKJlJ0mDne6qcvMEObSztJMkUezjFokTPtmSjrm9FTkvJklo7DvrPOuUAS3/ynhww22Jcg+Ik/DHui5T7aoFnesBXVaqlZjiJBqID6JQInDlPYHEYMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8VFmRTX; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8VFmRTX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6f9e2f681so35878305ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788196759; cv=none;
        d=google.com; s=arc-20260327;
        b=aPLnljwR2Ff1txGvFa6pAy4h+ZOZVi+ON11jv1P28J6W7vDzytryUdyUHY9+9rKHOL
         /L1Qv7VAQwAORMmodYGm0b19Yq4o+7VhOeS37qqFb/Ij5SAVYqP/d905l0zO1sOYP872
         nHwAbNAotdyaxhigAv+2X/B2i3D86+Eh5H1sjcTqZc5WSXVy+/31Vsv6fDFj4wkBvDaK
         CtvdQDHEAmMiqHI6GHdgUCdESH4zFh6LQKsT9cqkdLkaWCZkhxSPzI9qA7KqI5SaaU6z
         CFEN1cJdzfozVwKWU0GtMFtSGgoAae8UTZ8B9MXl8TrDN7050RhILMVPudBIS9DYlU46
         qPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        fh=6WeJVFJ6L1A0pe3D8jihA3N+iUposWKmqWkxQ1hJS6E=;
        b=iZcKmx5w4ICCJvxcjHET2uHN+O+zio71UYaUEAMHP+6huBW4iMRQ7K0KaJ/eCsvZey
         x4JSjGC1u1DvPKUcFWnpIkTbqb4y3Sc6FMvNFAjQQeb6mCNJemIcsKB/RcjygZ5zB37G
         vN4vXDnWG5hiU2YzXrtFzmwC6jYROXWR7RV/44UO2JtE3ADQzmLnyS7xLTlGztAKWNyn
         L25laDhbthaD9fGISwFTOfliCHe/hl9hNpEWMvzyIzE4Kc1UT7KdOBCtOCKJzMvf63c9
         LlLHPeM9s621kCBh4hgsSEmlb1Mb5bDadi2wKhPIVbF5exupY8S8U/XGHo9+kgy2dsyp
         cLZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196759; x=1788801559; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        b=X8VFmRTXbvDqoxLgXGat+Z26QoM8Ni9bVBsJTECGEijku1i+wcDfXJVjbcylsITqKk
         bhv1cBUe9psa+aH3B+7cG3i7eJTRuJ+JJW/146B1vCoY1dxGNH1WVqSQGPHer7h7IRmC
         kgYMIFn419e51jMovYk+v42CSgOpphBZPsjEdp0XZQlNmTYUCd+5XhWLAhKkczA3D8vp
         gA9U2ZxmKwd4CRLax+Y+c+Dl6RmHYNAejHuYdfT9DphQalkmjnKInYnXcWwhAPui9gR6
         hAQOtYC9tAbqxyrXWINhQG9rqgP/wme2R9i1cZYbgsxHn5tbRMHUVzIXOJCfLVkZ9h2k
         H3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196759; x=1788801559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EceNcS+Z+ajhb8CIpd8JlFdQ1JxKxr3f6vg2kh+0pjk=;
        b=W8MjwLWbBr3ampC869TlQSbY+xAaS4JL7rOQuKOSJ+jF7X1xtyoqxX0C8G7D4PbE+h
         4AvGuqas0ic+gYSmC/ZDULI9vAUiD4oFKVdIPiShZgAv8c/ukk8TG8IxrCgO0o/P854U
         RNAZjN1L78N6CshJTeoVBDznwz9uqg/V21fF1ldRxC0uCYuQUXtPZWVpTn3Wq9PKGTMv
         U72m9lFaQJmavsB+RaZNq/0wMuvrLJNrwnQ0/1kpI8PfDqJuhOFgBs03CvDlTxeEwimh
         X1pZRG6Fwp2IQL+N5PP2eWTLKDhEo9fz74a1xgW+ex/+cvsKcGjAzWquYA6pbw7IaRB0
         QCXA==
X-Forwarded-Encrypted: i=1; AKwUvBz3Nbb7rlgBkjeaPvsnxbSvhuzllEdmNiUoEyDvmFb2C1w3NgOffzuKmD7VsotHu5UeMgN06MC4GS4ypTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mzUN95Rjl17IZRFdMZj+2edmDa1C4PSUyJq6n6O74YbFwaNijW
	2YDQuybeAhghdB4tbc2CITgryljX3cttRnreSxw+YPb1obLHqUCrmRO2r3KA1JENMN/99zPvNjC
	Z5nAa1Ud42VC0R5n8d85smX+zYWred+c=
X-Gm-Gg: AYBFou0oiNTjGvdjUov7Uf/I0htMhjFQWCEkj26PzjQmlGq+tXDB6Nyz+vDsO1e07dw
	gpn0WyC7l8cK4tNvVyKL99DkU0uu49eNPIJe8n0ZMNLUZIqSGdBxLyNN37abp+Nphg6rCN+Yv9O
	YmHKHOyI6u3rH0E3V1TSyRxlGI2oZyE7KzCdwePRijqTmVj1msGI16WYP37W5NkliuVZtCdSHEe
	CQW7KBCr5W51W7CAMdVfrj4lox7Yppo7+vrD2BP8JShWaMZhJwkGvw413Zwwe5vSi6fdpb9dbL7
	qsMghCdAuAggHEiOduufeLXQ1QQVAuys+RH2s/d5OXhLczTR8AGmcujeW+g9xVox+wH7xf55lgJ
	KmDoNWkbbHQEsMQYsDUEp9IeNcS8XebIoQBLsiQaldrl1iQ==
X-Received: by 2002:a17:903:2385:b0:2d8:d4ce:7e40 with SMTP id
 d9443c01a7336-2d8d4ce83fcmr275351495ad.21.1788196758727; Mon, 31 Aug 2026
 10:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
In-Reply-To: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 31 Aug 2026 19:19:05 +0200
X-Gm-Features: AcwNN1WRhzKCE3-qq9S5IPJctdndIBtS6owhuM_r8cD37FzQpK4fkoVAkjdiw9s
Message-ID: <CAB95QATuQcbMWVGP3GdaguhC=MUEj3ZpnAWkJ1nyUjaSstWXxQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
To: sugar@sne.moe
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 31 Aug 2026 at 18:18, Asai Neko via B4 Relay
<devnull+sugar.sne.moe@kernel.org> wrote:
> Changes in v2:
> - Reuse the existing X670E-E board information instead of duplicating it.
> - Link to v1: https://patch.msgid.link/20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Thank you,
Eugene
