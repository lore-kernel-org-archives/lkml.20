Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631833BCD2E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495129; cv=none; b=RYF5dbL67GPHxONPfgMQ9Hi60zdArOaqTeVf1vKcgT6Dl8IP4Igoz/pLEGIIaQ7Vwog7gKKYX52ytZ/hDuAkzpv5otYWxDgwtq6RlRbODfohl6Tm0HrMYYQjmQqW7LOXJQiCt1Pxu9RyS8F9JfWKKRhU5n3Qwzht0UL3fcfLHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495129; c=relaxed/simple;
	bh=UxWpCJoqhhTQa5rxW7JPscFXgH0lLGJqCFFyksNM098=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSQQJlI04bVE8n/w1FSV1iVTPjPEXa3IBfTVpD8tQVrY6YLixR13ag8G/tBX7uoKAT78cQzsoHsRd5bNlcZTzk/T2CjFvqGycqL1mzrnlR+dLtFEb3j/eQtnlulDaUthMP4S8tffnrIWRDc5G7XnFo81Et3kOYQfeZ078X9HfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsYYtEcH; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsYYtEcH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48436686a40so217480f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790495126; x=1791099926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCDVY0S12VqCwjPRazOz0k33aw3HWNfWSo3pYCyR95o=;
        b=BsYYtEcHOGbYw71jDDDsxX4jm8pfQqMXjK6ZOf5nArfqyO8nwgX90TEGCYv1z9Xmjq
         PBjeXFOixgDtcql6kscGELlpk7UXMQvEcR/KL3vzsllw99MZztx7IEgI2GqazC2Z6Cfp
         4aRK3cz8XZXhsXsyv4ukmOFwsRWk4Vzco5VlrTWW+nHT9buo1TGGbKTqQeVpAxoXsAI2
         k8kdgWWWZzg7wtVl0e1SPT+X3vOqZvjadtey6ifWra7wwHsupeerrCePxu9SEWll4ADg
         yzM2PYUsgT0Zoq4WMi3+ysthr7oMJyp9C8EcLggWT8vE8ZgMfnuqxZu1LPLjfilHl7LS
         qblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495126; x=1791099926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCDVY0S12VqCwjPRazOz0k33aw3HWNfWSo3pYCyR95o=;
        b=Yd3angGqXQrMbKlmGa/BCwUwjyGJG37HIbdZNaxe3xCX2CxHrxxZz25S/CGiuT/rqM
         YicMcOjPG4iXA8RsBqYcDRhADOdgqKFPUS7J+rZD5lSWBuQPA05wJUGXicdpKAXWCZ/E
         6CQdx2MnKoKqc+Xz6Fo6kTY/SZ1YbyvWHyKNPWHb3HPs6gsP0sRoEeeqHGLi9IyIRLn3
         sEfZdg46w9pUagVHy+qrHYz7LSrmfu2WIHCnx6z+WGDWNqQ2I9idbvnUmcitr21hfQCe
         je++kXTgLiSWktYi2txMGzLz6HzT6RAVjjewwAMymLAF/dsnKoWRlshslnpMfLOMcfvu
         MlMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEzvZLZkNn1EwCfDpsLeSHFq6pnv+I5mAxnK0sNeqISKQ7O2tbGoiYuuMksbK4joXaEirkWTck827vqfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEKhYmJCoBLca+WdNGm+b6RaBRl0M+npthqTPhaMtMcN84OjHq
	3CIsnp7UicndvEUyXdHAEV9UkSCTGyxrb6ycmesYfpulikf5sQo47Jls
X-Gm-Gg: AYBFou2y5iy2vCRBeV6TObApQHWYskodwmA8p46GMQh6lG432luAR+obqatYDB7HDhN
	bal1X8tApFB8IClbvxaZK0aiONWUADu4aeuRi8XUJVqMZSXGz3Io+NvyjeY78+LHWZsWBGUEB9B
	5hJNpfGJfxd6DVQqq6KI9F5RzfL2zXqNT7/xHaSMae0IIIRW5qb9MfS6Tp+RYTl/b4RLDSfrINi
	HymwGqz6Xkak7i8fiZf/S4JlnnBUxt/HpXG335sinnikDgB+OLJQgoA7sGMMiRJlL9RgYPIaP20
	mR3jBAfV+XfSC2dDsaZVogr99GVwJKGzd/JJz6y10N0My6TZ+7ynDiPccva6jpH3R7xwi2qx/iz
	dAvzuMpFO2sva8tyuqWyxFBHpSNJDgJBJ+kmrFVUmUWCt9LbHcZ2/Bhflogkq9g5Ur7SmPgBCYm
	peyUmJ3gXfGBKOS7yssjh1KbWiuye1VJEJ5ulI/rQIIzojsQeeXgVGaxAyVfTqCWn1enliwUCt5
	IO5xgCYn9uT35hDB6L7
X-Received: by 2002:a05:6000:2c11:b0:488:7787:4696 with SMTP id ffacd0b85a97d-4887abc29d8mr12240418f8f.5.1790495126398;
        Sun, 27 Sep 2026 00:45:26 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm19005883f8f.30.2026.09.27.00.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:45:26 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	qyousef@layalina.io,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
Date: Sun, 27 Sep 2026 10:45:23 +0300
Message-ID: <20260927074523.14558-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtBAhMVa02Z23=nNZkx7Qum0x=U_KDCn=Gr6Pnf-SG4N5Q@mail.gmail.com>
References: <CAKfTPtBAhMVa02Z23=nNZkx7Qum0x=U_KDCn=Gr6Pnf-SG4N5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vincent,

> > > Add a new level for selecting CPU when select_task_rq_fair() fails to find
> > > an idle CPU. This last level will compare the slice to select a CPU where
> > > the task could run 1st.
> > > This helps a waking task to select a CPU where a longer slice runs
> > > instead of one where a task with the same or shorter slice already runs.

> > > +     if (sched_feat(SIS_UTIL) && sd->shared) {
> > > +             /*
> > > +              * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> > > +              * the scan when not preferring an idle core.
> > > +              */
> > > +             nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> > > +             /* overloaded domain is unlikely to have idle cpu/core */
> > > +             if (nr == 1)
> > > +                     return -1;
> > > +     }

Ain't nr_idle_scan shows load of the system? Even the comment at top talks about
idle CPU's, but we're not looking for a idle CPU right now.

I may be getting something wrong, so please correct me so.


Thanks,
Kayra

