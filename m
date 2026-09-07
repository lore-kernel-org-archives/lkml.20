Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2E442B1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783590; cv=none; b=tD4dTcg3REFMI2lgudp0IahIXTbYdbqOMf/HhA4FmZof00HZi8KdzN1Zab1qXh5Ii+lYjYmUtM+6bDDadmtVqnlomF1OX4zvXGfPkucL1ldDGzCj7s00875UwgO3eeJH9YQCwWlw3iBsq6UQNWmx2jadZB32/GJWx5Z/CR0ggxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783590; c=relaxed/simple;
	bh=8sWGG3Euclft4zNcorzRAt017Dh4vpMTzE9Ojma39XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTvn9vkltrX98/4BGIylRQebYNk9Rr8FgqNgyQ+5DMGWO34PnDFuXqHvOEC+8qQ2lSl3sPUfw3HXZRr0y6qaYbf+U2st+Y2AlvYfo9rkm1FiaGTtiqTdpfFI6m6//eFyHfvY4OyV/AQLK5DkCtHKe4xWWdxXYempF+17JdOJYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c56dbc3a51so1235450e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783588; x=1789388388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tty7R6qNyM6xJP4pDUeVUDGDAPfBrPAZij5mJHmykyU=;
        b=PIENvuVMW5tidI4zsv5+j1DeJhdPyMcOUsnjj6Tn67HskvTaDZBgDVMTDeNKKhqIup
         JSWmTcis/42u/O5gQ/Zy3cMJlnkx+y2yB31jyTeWnTYzMhjArs98oRp8HHExdMHOjajo
         7RHEZ/kPH6cPaeOOdyycT47JW0kvECJ58YBdcxMYz8tCaAcluXXZEeyhMzHirq+YmquT
         gAPiIrbecd9CoeZoX9V/quH1RDFHwTe0vCqUoRZqCU7AjnDPbknd6tvB6b63YwjNUBA/
         1W0FB1vDpczaN0MxW336igtYZ1/szJ53IQwEptkWVELlzs09a6Mw3b9OoRSC3RCvWMDw
         8D2A==
X-Forwarded-Encrypted: i=1; AKwUvByV3xRNM9j6MwWlJaLHr4jazC31HzfaCY7swvink7bC9iXiXjQYZlqZ/cjI1GV6KNg934BY0KzSqUKQtF0=@vger.kernel.org
X-Gm-Message-State: AFuF++mqZG25Noeg3AWOxH906F9Tux8X7pxgXwT+LuvTSC4bHB/J+gTM
	8vk+uo3MkFFVbeoDtKNqwfYjUwWhSOKJiZ6p2QggBqiCKqNa9f4F9rmSINZxvyOQ
X-Gm-Gg: AYBFou3jeIDbdpA3/4NVMkUMvt56bV5aJlebXPLqA1MUDudIyIskGbupNo1dIPMk2i+
	clMlbOICV8zssc0XIunmGl8/4tqvq2y2mOScRV+dYAC4rBJxjg/t+t312FH4Du7dnAXWKVpQWci
	ByFKYVvbzrWjGQRadKKiiWElnuxcpF/DXyYITIVI+WcKry6JCFCPojhgoBs2cyrZXFhf7tV6wVE
	qWdyd99eLlKplLkLlafKO2PbyhPjKxBO5/BpE7O/Uj03pbJokoFVzCELirKfvoUMrrf9P/QQ9T3
	wCgyftLKbspnEy67/t75pvFEf81AJugv9KxRYhRd6zu6wsN32PXyyVgTtOCgplyLE24+kpGa8cg
	4No6yuGUuAH4QbgpRN7ierD18kwRA7SM4aEifxi4zF1UUfyH3UuVSuiXc7Ir1EWJdndmcdgZQNW
	nu5m+tKQ3xKgY6HokwI+IJxaQd6kyM6mlpqjjQG/VPz7qzJ0Rvdx0YwAhyrXACam1qQCZB3+8sx
	YELp0JiA8KCCezfvuHkg0VjdA==
X-Received: by 2002:a05:6122:8b18:b0:5c5:732c:f4f5 with SMTP id 71dfb90a1353d-5c7ed4e4296mr9356246e0c.8.1788783587799;
        Mon, 07 Sep 2026 05:19:47 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef798sm7715376e0c.4.2026.09.07.05.19.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:19:47 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97e9fb0fc58so841968241.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWnaM4wATmQDCR84TVqWsXMzFJDeclbyctKRraSN1Y5r4kbUEEnKci6/fNHU8xkH7OFDUfBY6tA4tMEZ0=@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:778:721:53db with SMTP id
 ada2fe7eead31-78a4a4ca11amr6528611137.0.1788783587284; Mon, 07 Sep 2026
 05:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
 <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp> <DL91IWM6YXRN.3892K60CVKZ3U@gmail.com>
In-Reply-To: <DL91IWM6YXRN.3892K60CVKZ3U@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 14:19:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW99QjUrat+K_Ot025Zddb5p-rBhpPxP8EAE6FmfvEnWQ@mail.gmail.com>
X-Gm-Features: AcwNN1X_Y6VTAkiTUVaCeny5TBDUQ3QnkakivGhNq66Ha3LNCkcjAS164CJi4jY
Message-ID: <CAMuHMdW99QjUrat+K_Ot025Zddb5p-rBhpPxP8EAE6FmfvEnWQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Jakov Novak <jakovnovak30@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Johan Hovold <johan@kernel.org>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>, 
	Guangshuo Li <lgs201920130244@gmail.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Jakov,

On Mon, 7 Sept 2026 at 13:18, Jakov Novak <jakovnovak30@gmail.com> wrote:
> > syzbot has an AI-generated patch at
> > https://lkml.kernel.org/r/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.kernel.org .
> >
> > Please check.
> I checked the AI-generated patch and it just uses the deadworkqueue in a
> new function. That is the same thing I am doing except that I'm using
> the vub300_queue_dead_work function instead of writing some new code
> that does the same thing.
>
> The real question is whether mmc_free_host should be allowed to invoke
> the sleep function or not. Geert needs to elaborate on that since he
> added this change in 1036f69e2513 ("mmc: core: Cancel
> delayed work before releasing host").

Why would this not be allowed?
This is just in the driver remove or probe error path.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
