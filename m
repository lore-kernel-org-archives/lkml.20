Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE437F8C7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541230; cv=none; b=Vfoy9gbLuPqOB9CiCYcAhL6fk/FvJXXQCdbBzvDrxWCPODMkCUGxrDI421GLyiTQ8WpnxShc9IjOyeIQiP+7d1D+8MQ2SQnymO3eUHiD1/4CCQnU3z/VYppTIBFry9IMkh8mDH/+4Xoc0HO/sW8JZlFIB63YfZkmXIi7S+nuSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541230; c=relaxed/simple;
	bh=ZdzwbYcSxFp1YM2NzyKteD8bxTtEzteMVXqKaxQGfHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epaocfssw1QjjytttttJ+j37A/CbKkcd0ak8tKA5ymt14B6XEcPn7Rcxt3Ebi3uSX0Bo3Hxc8N8KwGqw2OxBCK0DvFf+bKc83Y/sY7soKoleTBk9vVa/n1P5arTcp9t+hz+Mgx3tAusbMFGX6UoTLEUDEAOABqs63eHuG31LyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c20e70a0962so161229266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541227; x=1789146027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyJwn4+ssjywZb/F3JjOY0S6/aIo0tP90S69DFDLuSQ=;
        b=oUaOCuem18AWT+dck6B60pbszVaBH3yQXSDXM2EoQYF3vsHO8gYYWj4oF9vsbRy8YR
         v5d/fZZEN2FS9wvm5qlyK7DzdF/rI6hdpyW5a03KlFJg9Yd42CYRCSW54/9bWaq/D/U/
         QN4/cq3QAtGhFXT0hao8Z68YnAEao4K4ZNobWH4pYPHwJPiWYQWfmSHlSPGJiuBEcgTe
         7RlqfLXK8/9D0UFslHL3g8PdVgBRhRKt7xPNFSEVVGIn+CNDQs5cneelSP29imyDcYuL
         xdEonZD1lCWRFVHNbIPDLCZCTPXYBZ3bWDVd9Vha8/E13N/MU6j2Wkng/5xcjpUWAUmv
         sqIA==
X-Forwarded-Encrypted: i=1; AKwUvBw2tkTJLyoSlEGP5dkBkqAYPTjX2LNaUFmzl7LhBfg0w3gQikVKAHo29gl/o6HwYlPtRvdE/fBYjV8GHkg=@vger.kernel.org
X-Gm-Message-State: AFuF++mix+rRcHNujD6p8apqXR5jPEjvBpZeN8u/4ICoRkbN91kbpg2Z
	XrFDGSeeUhVZG4u1jCuOaEQNR4cky6/u7NynE7AgLTbz0AxYzeqw4rIJ8IKjP5FI2/TF3w==
X-Gm-Gg: AYBFou0I7M7HmRZwVr9qGgGIjIlvg2l0DiD+Va+Sm9LAEzJbBHUnLOlS1dFyxRxtkUc
	iwEBhh+j9Dt33Rxc3ervr7YXJwo1VGTr9US8VTlk6MrRm8ubW1x0Dk/gj0fOwOVKZXDOY+XAu3m
	DvmpQH6aen/nb2zrFyVfdqcp97pq4cEAWFa73UUI8lJfMeRhMSzIC6GEiD8g35AF4gItifBA8TX
	Y1VUo4v26bdeBxvnKnuzf+tPlYdmUE80GVt5cRML4nHMsyNrwDA0V5Faf3AnzdyFfAzP/pq9tC5
	tgdMBSJaJnAJ2re7FPcpyFGek+WQs4cLlAmw96TwdPsR4+jMV37bxvqG9rE5+rFwRoPQp8pML0M
	9/UlpRiOiNyy0ZNpc9cOl39+uVWtsDRSk7ZEFmR5u8y4tU+egBvEyzt8y7lCfskv+Esy6RC+pdD
	0qiWaiudx3uqKG2v9ArAJUureO++6vCv4MZXYwdOa+dMh/3OFBZL8HSNci2C70mMkSsS5seky37
	zG8Y51nJYF/RuJ/G96y4taaamCmj6zCda1oID+2XAkqNPfaiMwv
X-Received: by 2002:a17:907:c017:b0:c25:6210:84e5 with SMTP id a640c23a62f3a-c260c9dfc39mr584744266b.14.1788541227117;
        Fri, 04 Sep 2026 10:00:27 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d53c37csm132763566b.32.2026.09.04.10.00.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 10:00:26 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so14307155e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwT7Sb+bAnV5byM6MQJzBgglKLD8Iazb4Gk1Hqdesgf33o6kGuPFSZRGZJlb0qRkz0+kgqlzCNu0EjAegU=@vger.kernel.org
X-Received: by 2002:a05:6512:3502:b0:5b0:23b4:be97 with SMTP id
 2adb3069b0e04-5b616ed4b1dmr2357411e87.6.1788540878064; Fri, 04 Sep 2026
 09:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn> <lhuecf9cbl8.fsf@oldenburg.str.redhat.com>
In-Reply-To: <lhuecf9cbl8.fsf@oldenburg.str.redhat.com>
From: Chen Linxuan <me@black-desk.cn>
Date: Sat, 5 Sep 2026 00:54:26 +0800
X-Gmail-Original-Message-ID: <CAC1kPDPu41RxMLHpPtz4VqfkEZeu-fYXG76XVZMh8bbQa3okaw@mail.gmail.com>
X-Gm-Features: AcwNN1UgBltmpHY5GDpzTdve1vmhfclnbN_NvQgKzWwvr0zbygpAGe7Eg-teU9E
Message-ID: <CAC1kPDPu41RxMLHpPtz4VqfkEZeu-fYXG76XVZMh8bbQa3okaw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pidfd: add task path ioctls
To: Florian Weimer <fweimer@redhat.com>
Cc: Chen Linxuan via B4 Relay <devnull+me.black-desk.cn@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Kees Cook <kees@kernel.org>, John Johansen <john.johansen@canonical.com>, 
	Georgia Garcia <georgia.garcia@canonical.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, me@black-desk.cn, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 10:53=E2=80=AFPM Florian Weimer <fweimer@redhat.com>=
 wrote:
>
> * Chen Linxuan via:
>
> > This series adds PIDFD_GET_EXE, PIDFD_GET_CWD, and PIDFD_GET_ROOT. Each
> > ioctl takes no argument and returns a close-on-exec O_PATH file
> > descriptor referencing the corresponding task path.  The new ioctls use
> > the same ptrace permission check and nonzero-argument rejection as the
> > existing pidfd namespace ioctls.
>
> How would one upgrade the O_PATH descriptor to a full descriptor without
> a mounted /proc?

For PIDFD_GET_CWD and PIDFD_GET_ROOT, the returned O_PATH descriptor is
typically used directly as a base directory for openat(2) or passed to
fchdir(2), so upgrading it to a full descriptor is usually unnecessary.

For cases where upgrading an O_PATH descriptor to a full descriptor is
required without /proc mounted (such as inspecting the executable binary
from PIDFD_GET_EXE), users can use the newly added O_EMPTYPATH flag with
openat2(2) (introduced in Linux 7.2) to reopen the O_PATH descriptor.

>
> Thanks,
> Florian
>
>
