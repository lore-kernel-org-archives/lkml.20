Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B40231836
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226020; cv=none; b=WvShOA96CupzybjhIDNnOoBmb99nAuX27YnZXUgLFIj+jBkUE5ofYJwTUUQK5cq/KQ2oyqSOvml2cRit1ybfKM2GTf81u3sij+stUBmTZCbLx5/AF0DEWS1Tld49ahbBj9MWOs78KbOyB9Qd+NR+vm/o3OgIyJI7cQ4jGGxhix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226020; c=relaxed/simple;
	bh=F1ijpYANID3xLVMHVmK5U2Z+BXQgaXvQfo3vjZejkAk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOHh8UiR4iPsxjzshpROddR84u89hrdV7x86PcJ6eQKdtq4+vPfhg2EgqrgBXjiAbPpCa7aBnPxiqRWLP4BcAGJJbWqbcPR1h1gw8Lh3loJ1ipZYx/ybu3IJgfgnx8o53mpKEqayNzW3o5TopQeOmFP8+0EpTGvZpXTQF10mccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHyzbvQb; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHyzbvQb"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01d89b23so1099458f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226017; x=1791830817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eOi8eynqTk2PQ9A1YtVNTzOJuded8lsvFakB4HYF7xg=;
        b=qHyzbvQbTGF/6wsERgbsUR7AHFtwUJPsGhHBD3q1EnCMHH5AM6QbaHrwGQP417nNe8
         mwOGqWkqUXPSB14Ys+vCxOlOrVl+4H1DArV0v7f3Yq25wR3UyJNqeG45hrljs7TKigx7
         cAgN22zmz8vFyc4sE4QApJer6OvG+KQgAsvJkjy80nZjSrtN0o5UMLkGs4ddNrB0aBdV
         Xrj0l3poT+yYUinYlynfIPWk7sJEFW/A/oZwDuUUKR++2AyzTQrytTqIvUIXmfe3w6s6
         ExfxBJbQQJov9A19oZipKu6JwFJFQ80fPcNzP2tCL7t+ZuqL7bIQ0KUTgdHxCVSTq4vy
         yObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226017; x=1791830817;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOi8eynqTk2PQ9A1YtVNTzOJuded8lsvFakB4HYF7xg=;
        b=th2YVJDoZw7UElKyROGlhdmEtlG35XhGUxO7nwzPD9KyXZNomEi1TYdevCd4bVseJo
         W4oMeqTTRRImULbiLzThFDiilSkPyzwTwHmq05n2RIQP/5UO0UkXdZMkXzHxjZ9RkfsW
         O3M9jcH39BcsLlJWvYoJmJAGK5Md/ADbTE/fFU/oLzQIaHwOsTfpOVG6hsQ9l50b4zLe
         tSLBasVTeH5xwf5QZsru5Y/F4V1pekLpVl5WYOUP6q3a1NQQeCYQlmmX2HDTe6VVQL/6
         SV/wIJgGbptAf190EBYarA+FCCBx1weL5nhCnXUE7V6xrirCoOCzXA3r1oBlQhaz6aeq
         x3UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdtV3JA1QIXP0L/YwmCLweZbRQUvqlh4Aqd2jK17/7l2ewLpk6OmvG+LJfOtzYP8b09rCe932p2/7GTqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLumceerjJnP6pXfjdgQnPDaHWMu3tvhXLgnDJ6RZ76nrFzGby5
	H4TmvIh1ItF1qO5xMpcnD9N9utovJ/ymvR8eZLciggebiIZa4dbA1901
X-Gm-Gg: AYBFou131/vtVv+vRr2fr5BLnpF/oFuAzDfvetrdsYpErENLIGTPw1gxcZGRauK9b8y
	CM2+QRRk1TVM6jd/FFxow6yEwsqGbQTgugW2KNSRyti4euQCxxkh3ZN9vQv7MMBkjlbFHBzkhMP
	kqt0vzprP9crN2+0HUAm4QwxLdD/sI1rMHg6ubaPYKQB8iHUXak0qXGFtPTBQuti/dVRnHnXGFY
	IGstJeZIcMIqbVanfvjxJCBAy6qzPKdwtS7419nxw9sMbXVpFTn7dL4Ed2XqZKu/MNNeraXgME4
	RFgLg+Cl9x2UAwP6Y0tJa6KAvt91zmbc0Uqx6K7g/aygQdp7FxiZ1aJujBHBtqa49G3oucV4Bdd
	ZO6JfcOpL/BDJUu8wZSMQAtRvnR7azfw7r6J47pe/FW1p+5ew1biEDaReGINyZWaQGwWxISCSHE
	LGJ5aJkNU6w6iQKu56gf9eWafoSH3Lgmzv2GcAsGSLPkyld7WGTuaoaWbog6JuVGzRGcPAFXwIQ
	bPIO9Eoa1NWByewIqe8+OfPQ01cyPjOOIqUFxyTTrxPWQ==
X-Received: by 2002:adf:f04f:0:b0:488:88f6:36a9 with SMTP id ffacd0b85a97d-48b12717780mr14643263f8f.21.1791226016957;
        Mon, 05 Oct 2026 11:46:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm12255235f8f.15.2026.10.05.11.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:46:56 -0700 (PDT)
Date: Mon, 5 Oct 2026 19:46:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>, Christian Brauner
 <brauner@kernel.org>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Andrew
 Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <20261005194655.18e8d3a2@pumpkin>
In-Reply-To: <asO8TiCfByNjBHWK@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
	<20261003182224.2171b574@pumpkin>
	<asIwpkNr9bF6gk6Q@redhat.com>
	<20261004125118.7de53b47@pumpkin>
	<asJRMhSXz5XhljNi@redhat.com>
	<20261004143108.4b851713@pumpkin>
	<asO8TiCfByNjBHWK@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2026 17:03:42 +0200
Oleg Nesterov <oleg@redhat.com> wrote:

> On 10/04, David Laight wrote:
...
> > If the 'add code' all the readers and have to hold the lock then does that
> > leave anything other than task exit doing an rcu-delete.
> > I wouldn't have though acquiring the lock in the task exit code would
> > be noticeable.  
> 
> Still can't understand. The exiting task does take tasklist when it calls
> detach_pid().

I think I've confused myself :-)
The delete needs the lock to avoid corrupting the list.
It would be safe for an rcu protected reader - but it doesn't help you.

David
