Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431161;
	b=Ed1OV9dO80XXTjHrqdT5CseEIuK5kW67enWWeusKAbEfTn4OznTtH7a5deDbgKC9T9WU
	 paf1RAq3Leb3Wvj+QSpXSMNiVi8MUtKGi/zQ9lTfs+fX7WAkvBysx76BqF176iJphxqiP
	 jQcoL4b2p/SK4oQgBBw+6MEsukU1StFMOpyucYKsGx5kRBW4dd4GHD65a/+k184Q3Wpz0
	 eWF0kUbRJljMp8Oy0LoJgD4pe2UdkG+814hwxQtnqZNHUMybdwkSQkPL9/u6SAHEhJyR0
	 eSAqXLld4l3U/LFxPEueGTvxvOgJ7s8pg4R4Ky/XG5b376zphWItDMF/2jBixDuXNBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eLclega7SUgAlrP/YHd7B9RgRT5ZefPwtKid3vUTNJk=;
	b=i6T93ydVn+qOOIvbCBbAMIP2GaMx8rcR2/A3PEwLaQKCCDdEBkrj7H4E0wDa1Zx+IkEQ
	 GRpGh7a4Ugo1LeEClokASqtH4JnkMMHM2jmisUmXF4wOn6uTf5GleisRiyGM9sWuKyIaW
	 6+XONNLV4Fdtc3rsmlOtGq8vzbwN6E0tY5CAXLLnisrYMSVHwFNrGKnextSfRc2SpT0Lr
	 PGE/1OmvqV/cf0qH3Swu0eQQZdKRqys961ETy774JhjZ/njElAXsAlRPFSItHJ7qvjJ5V
	 3hCvi01irQfu+16oJPuEHoYgy9LsHK7WlUFK3amVDCglJrjevN5spBYNcYCbekQjtmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k915gHaf;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D58606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k915gHaf
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1783856f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431160; x=1793035960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLclega7SUgAlrP/YHd7B9RgRT5ZefPwtKid3vUTNJk=;
        b=k915gHafF+/iVY/Q6ZAmfO8fDiMdadtiXExpN9lHP3BIJ5J9oBa9HMzI2CIExOdhIW
         oSSBVatxd/t4grE6McdzII8L6581JtFWOjIlzFMN/ZWwUWaZjKfepLWzMwm510DEJ/Gr
         +/ZWVpPVziRHvxrnVtZH9L8ybidr1t6e6SP67UgHaCKOG+AUWhzvad8CkKjA5LPJcKgD
         wYR0jjAEGt8neGKxTaKH713B5bGB+Cg4/HSLycS0yElemRXMKATPeE7wVHgj/S0XAIGs
         w8cHTr6VcgVKAC7i4Pqd6hHvNxjVF+/406KJd4h7OsTy/Djy8HpKUC/b4QDDsaVeSifh
         74Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431160; x=1793035960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eLclega7SUgAlrP/YHd7B9RgRT5ZefPwtKid3vUTNJk=;
        b=AMc5rWZEXuBBncX1+CydORPbzensm3ayW4hkYLv1ydynkOm47OoEePwBa7W+XZU1Hd
         DtoigoXOpPYWoHgseTELvjsEDOyd0YpW51o3U7CTdjEeiRZ9sr/s0YGamsynvOzzA1Fm
         bZA7Q30aUlPbF2/Owuzz90Jp7M59ewpfiWXQaqxbjg4kQvLKCI6RSbdeB2kg1YIhVOqz
         D12JH8Ulq4oI10QRoKCX6jenzAaP3Tk9FEqBdDm7jkMjmadKAtAqUVoLvNBwoMQHraO/
         T8SBdRMuIRaPwLheKzr4qWGQkSnQdMvhUTAp6U/+d7NFbRY0hW7kOBCtLck0yLHh6lvw
         WslQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3y5WcbGQzKvK/JXvrgHawXEHrJmkCQ1vJFbMrvyRbAIQ42sf+3BsEUW4wdZsaB1Hal8KgE7IfRS2fl5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV6BPEOx1AeVLVsLHwL/PF4pSe6/zWDxQhNqBqFrAAjwhL+4e8
	z6R+QhgqpI/RNrBAREKlfmyjEV3kIS6LSGOkqT7Wv/QY/KNMYtZ7+aQW
X-Gm-Gg: AYBFou2uD3s3iulKM/Dh2FLsRaJJFJeQwbFCUwjV8uX0+2jjRD1h66D1mTAkqSQlcri
	xuOJJCNxAF2z7LW53NTtAap2uXyV77xfhlsHGGQbDHpmi3Wb5YmxnxfXpXZ60TuX5a3tlbs6tw/
	k+Ew8R7YZTn4jKnCoooTRA04cpl8AsJ48GSKNZleXNlSqcpmFG61zZTaBdBPYrGbBPNDze0Tq4D
	CfBbaJWiOhca6F/CBOMMlfuCubBfvPC9XXVNz6MWcyyH2BgPiWcim8C4j7jwQhMxX7U/o6+1CmR
	DTe6xAdn69z5VK8ohixahbSTOBoiwYK2nvsmdxDAPcdDvpDHKhYVyYYON27KkqWRuPmFiU45KnK
	4iTnw7FMT0JDZUBzjhJjCHGZvIChykaA4/+LFyoKTjvKs0tvM+HOPZntlH3VGzPfz5EjsGeMO2L
	2JwV3hdDv8FD4MEfIYh7rKf/wlKIEfNQ+jBZU9ljAdr/DSp4fJ4Z3DgBkS+R09rYmcVW7vQvNin
	Qxogq4Xea9Sbj25tr0t0YkuhW9tNQv7IaICZjN/LaM=
X-Received: by 2002:a05:6000:46cd:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48dfadf34cemr19629395f8f.3.1792431159687;
        Mon, 19 Oct 2026 10:32:39 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm253426f8f.40.2026.10.19.10.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:32:39 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC -rcu/dev] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Mon, 19 Oct 2026 19:32:28 +0200
Message-ID: <20261019173230.73558-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AFA8DFD1-7D1C-49FD-BE53-95747FE4302C@mainlining.org>
References: <20261019162005.12888-1-parri.andrea@gmail.com> <AFA8DFD1-7D1C-49FD-BE53-95747FE4302C@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 05:22:54PM +0100, Bradley Morgan wrote:
> On 19 October 2026 17:20:03 BST, Andrea Parri <parri.andrea@gmail.com>
> wrote:

[...]

> >Fixes: f23d7b47ced9 ("hazptrtorture: Add kthread to release deferred hazard pointers")
> >Assisted-by: LLM
>
> Why not put this into a series?

The two patches fix unrelated bugs, touch different files, and apply in
either order, so I posted them separately.  But both are for -rcu/dev,
and the test notes in the hazptr patch rely on this one.  I'll send the
next version as a two-patch series with this patch first, unless Paul
prefers separate submissions.

[...]

> >+	/*
> >+	 * Run until hazptr_torture_cleanup() stops this kthread, not just
> >+	 * until torture_must_stop(): the writer can be waiting in ->sync()
> >+	 * for a deferred hazard pointer while it is being stopped.
> >+	 */
>
> Could this be shorter?

Yes.  The comment in hazptr_torture_cleanup() already says why, so this
one can just point there:

	/* Keep going until hazptr_torture_cleanup() stops us, see there. */

[...]

> >+	/* The readers have stopped, so nothing new can be deferred. */
> >+	for_each_possible_cpu(cpu)
>
> Is the comment needed? I don't know if it's nessesary.

I'd keep it.  A reader can defer after the last pass in the loop, and
kthread_stop() can then end the loop without another pass, so this
pass is needed; the comment says why one pass is enough.

> >+	/*
> >+	 * Stop do_pending only after the writer and the readers: the writer
> >+	 * may be waiting on hazard pointers that readers deferred.
> >+	 */
>
> May we shorten this? Feel free to bikeshed that one.

Sure:

	/* The writer may wait on hazard pointers that readers deferred. */

Thanks for the review,
  Andrea
