Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42E4E0B6E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009670; cv=none; b=YglIvJg41EJkulP59zQo4+pKc07y5SEJ7+vSxvHWo5fGmT+4cBKkWNPntZpfCxvBDTJ+f/cOBgkU31gV51QlncszxrgWdj0JGBP+Qbm/bwswxUk8pgD1GqAYhPrFb7UP7BlXlTz0qnlJN27P3ItwQsTi6iW/Z6LVexflP5tEgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009670; c=relaxed/simple;
	bh=hK+61oik5gsxN96IHn3CnokMCdTIaajwpmg47B7x+JA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFiy5GdPlKi1BTLgNHlQKIpnU3z6+iUK8DBBUam5WRl6A0ywcASUnPAc/fQ1S5G2518XT2nH+cE9C7a6qrcsN63d5PzJtIfw03EuLQtksyYmoPARjV9kDNJp1QIqUsvEw0AWn0zxYAgyNzs6WnvNRQwN2ziKKmHyPVXT31kz8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so2487720e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009665; x=1790614465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hK+61oik5gsxN96IHn3CnokMCdTIaajwpmg47B7x+JA=;
        b=ldms1DrtLwSd+yyLjNITzQ3kS5BHUU2oHWNZE/2S3LhyV67lUF7GRUv4UiwCYtWN2y
         6KmdjnQSr+k8GdQomu4/8yxnIwQDDFPy1vYQuK7/fz9HLbg2WtI9GN1xj4oYv5V9nXF1
         KsJR4sqKIWh2C80GZlsJLGRVm7rZzSK2wlnNhdzV0YORd6jp9Z0cqNk9r7+ziHQ1DFpN
         CnNOdls8qolzWLhh4pnsEw6FQ8etXonETTsx0QXdKn2eGod3agT5y76b0MS6DgcQb2gK
         pV8oUtDGpRwBWB3+1EL9AAXGQb7i4XlUuqcrBDdNddPn189qdqa5fEzw1JjJb5T3a68d
         SRRA==
X-Forwarded-Encrypted: i=1; AKwUvByQ6qmLxWBpqEUqt43BX86O//HdDUGex6+w/7ssnYW89fAma1pvVWV2mMaTnvxrBxScEXAN6/3032FC0/A=@vger.kernel.org
X-Gm-Message-State: AFuF++k8bvkz69oCErxKoP8S6TAlqQMvnscEt1CsJxbQrhknItSqCMhF
	y6LWJgjxkcVx5wmD3B5Bjj06jVCs5/LxdWN5/YlXmK2RQMQazqKtobH1WlBPXA0QDWqk1Q==
X-Gm-Gg: AYBFou3MnRHPXqIviomlj6J7Zm7aROiZ+0DQQga8ZONxBpK0qh00qxaGwUl4MK+IEDQ
	y2zr7JjCzg8n3BITm/D7zjCzEZJQkwn6DXiKxZJqFqeE1VknaTcHMSdLFEvaEwkWRREXVK2llP+
	F9UK5ryQN4cTgaFu9+Vhf4he9xbQmUf6j/LQLl1OPuwpqvIlEPsJfFoaJ3X4Ghr5eY79tjbZgqI
	o0uOhzlVw4xs6KBJ1d6jlYcM6fBQ/blaEOlQ5+4d/Ly2DzE3DM5FGzJ2l9LKb1bXm5jC6X80Emw
	R7AZch4sHafdSgWpRaCWdCP8ssdZ8EJ73pj+GikKKkiAlYJ+jarBLyWcc/iMWrHNuzdRb/237Xn
	ENssSVai56jb7gOewazB7vEpydnztitc/YTB/Uxfk//JlG6x5gqXD6NHBbsyKQUIHlnvps5Su2i
	echtu09FGqmENDUdfo9osibmDG8gXTksS3vwLQr6hgk4Vp7+ssX2YgUDcaP0n7rI8lCmUuqADg9
	n+61DJtqR63cNZop5v3pwtNDtL24xrGaaAQWLTdFt/qwxZUSZHaQhvmgYt+OSYU
X-Received: by 2002:a2e:a99d:0:b0:3a5:f044:fcbe with SMTP id 38308e7fff4ca-3a5fc0ddceamr27775861fa.24.1790009665282;
        Mon, 21 Sep 2026 09:54:25 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a607598061sm23259351fa.15.2026.09.21.09.54.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 09:54:24 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so3404670e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxKQJVOVKmt5goOWPb0k2GHFyGznuNdya1p950pZM65PedMvoeWOPVlZpXW0R1T4i+eUxYJOEG66rjEcmM=@vger.kernel.org
X-Received: by 2002:ac2:4c4e:0:b0:5ad:55f6:1ec3 with SMTP id
 2adb3069b0e04-5b8c181f45bmr3718755e87.5.1790009663874; Mon, 21 Sep 2026
 09:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn>
 <lhuecf9cbl8.fsf@oldenburg.str.redhat.com> <CAC1kPDPu41RxMLHpPtz4VqfkEZeu-fYXG76XVZMh8bbQa3okaw@mail.gmail.com>
In-Reply-To: <CAC1kPDPu41RxMLHpPtz4VqfkEZeu-fYXG76XVZMh8bbQa3okaw@mail.gmail.com>
From: Chen Linxuan <me@black-desk.cn>
Date: Tue, 22 Sep 2026 00:54:11 +0800
X-Gmail-Original-Message-ID: <CAC1kPDMCFoVsPDZgoCF6mHqHQafCkDc3Pohpp6pNOLJzE2OTYg@mail.gmail.com>
X-Gm-Features: AcwNN1U1zJ5xAFsdo7eYagPVPgcyEU2aovVJcIoR_uPclCIazBY4PYSmw97k5Co
Message-ID: <CAC1kPDMCFoVsPDZgoCF6mHqHQafCkDc3Pohpp6pNOLJzE2OTYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pidfd: add task path ioctls
To: Chen Linxuan <me@black-desk.cn>, Jann Horn <jannh@google.com>
Cc: Florian Weimer <fweimer@redhat.com>, 
	Chen Linxuan via B4 Relay <devnull+me.black-desk.cn@kernel.org>, 
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
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jann,

Christian suggested adding you to the discussion on this series.
I sent a follow-up reply with you, but I=E2=80=99m not sure whether it
reached you.

When you have a chance, could you please take a look at the thread and
let me know if you have any concerns?

Thanks,
Chen Linxuan
