Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C15388E4B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829245; cv=pass; b=AY1Nzfxl+wZSrFg3cbq1UM7ck/ta5IUIw8t/EeQMc7BJwkFyKyrzq904FstmhSswyC6RYE0xo8LDv/5qDiQRFAWZPht6rk1P4iWdJjGL91GTIDmsMMqTRmLB8/jZgONKZ+JK4Nronq6jBplmKGLCF0snXZutMTTdvp82xGdh8tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829245; c=relaxed/simple;
	bh=SsD7P6PfA1YYsVqoiE5QKifgHw2H/lNYtQ2xlqkrqDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+kpb7+eIUIuWwfMgf4RQIW1xdmZDcD8pUHK6x00dYvktwDoOxsTzQYBGpp0M4u6DrTL34a1tU95Dpacx6raPjVr/U5ehHw1/YNEXNkZ4X4xb54j845bZRIbRULMSW4oOzEAXKpPB7JS9oFN1P44mt5GFg4aM7oqTqvJ2TRdepw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSaer8p/; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSaer8p/"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d07so5348227c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790829242; cv=none;
        d=google.com; s=arc-20260327;
        b=fHY2FWHc2h0gf7QAUv1IdFDv8yZMcfN+a7bD45NxrVYAi6j2yqPsmukEYBvUDspK3L
         OT1fcPPVdox2t4IHfzZ1I7vUuASlrrOIQClCiSJ9y1oqmFUyP3r0kuZawD1qIAe67bYB
         H5epjDsjUw3uzi/7As6SxJE0GOoHGIV5JOXX+GrV9p71w88HF+qm5ZoG09aFxZYkavtd
         lhZrK5EmLQTq42lR2q/5rTeiWttU6Cb4plWcafYxDtFxtuF24wZw158lUdxBGKEwjh16
         2OIcwMOVQvzx5zwi0wpVLBhdxMd6vpbjZXpSRo+vr8YXDF5W9I0N1t4j0ITjiH7k/bs0
         SsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SsD7P6PfA1YYsVqoiE5QKifgHw2H/lNYtQ2xlqkrqDo=;
        fh=U3KUgUyQBZzc+e2sqkBH2sFGVIqYPRTJzNKyrYJ+Vhc=;
        b=CvC019W0w+MWOwWrskIi1pLg30Mn66es288dehPylJL8e4O3xCY7BcqoFUUlAbSzE+
         bmquWrDfKSeFniejJv0eFYEsqJH0HW0piH1Mcp2ysSI8m1KrG4mgBPUkKmDWbQdcNfkz
         U7ywlnA7dc/SvDF0EH7TatbJrwCyb5JeTENbSrLBKOPOQQAIpOVQFOJ/I4VHCt223akK
         MDcicSIpwFjcuDe7gLE4I6UBEadvfQOPJ1px4QtBaCj4u6OOZMT0Q6R8Z+iNY6v9U7pm
         aYUXL5F//ST4sYLy214uJkuzrP/OdIEFqtRkUo6wg+VhybOdtER1NJDpA6wb6z5H7/LX
         bvXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790829242; x=1791434042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SsD7P6PfA1YYsVqoiE5QKifgHw2H/lNYtQ2xlqkrqDo=;
        b=MSaer8p/sI42pnatnOD0xT1uwap1OtQuj/9Ums7pRw4GZxjEZYLnaAXrW0Abdisu60
         0KY7c19Q6nZChgecO0+1VxLfYLFlZFZn1J/jBV3QJO6mBVllp0FhRSakBri4HZtpNgcq
         JlyUvCviHjZD41Ycy7anEV13Hqg4igje66r0jgIc3m7Tw8MT4sIIiONabiyknRzcY5Xh
         X7zzmfbJjA0UQQsI+PE3xgCT3dU39WvQvDIdzQ+0hDxO1zoH8CoB2aPFlWS/bx+aOyXF
         YODa6bxF42useHea3Edf7WCYvtZZsJ3x9Nwkm5N/NyQIX6orN2ygv/uSfa+RRTet90kt
         YeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829242; x=1791434042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsD7P6PfA1YYsVqoiE5QKifgHw2H/lNYtQ2xlqkrqDo=;
        b=pJy0rFxhWZekap1IOijyi8wqiPqNPBA/MZDZ0m/sHsE1T+soK28RhU9ZqZZB0YGrhv
         ZPTOpx5LS/qG8UHWus5MLnuoQi+/00XXxJKza4XujpGLZfp99hrS2ADDqn36WjKoH9MI
         adewaLuFI9DbVdQZcygy9NxmcqWN/0JPOsdv5F7goJ3/EhN+PgfVm2I4sp1sfXKDwMK4
         Zgz5O5nwFxjO7vhzxGUv2mjLSHLaP9gyhJp0Jogj8xlJkoFcNBC16CK89xcgDC3mhU6d
         3vRDhHutOwocR0+1x5lvTBJcc4tKEoUAc5Y+f4ZX2ba90my+nPBwplWTU80WZHNBeAca
         nOiQ==
X-Forwarded-Encrypted: i=1; AKwUvByErHmlOQl64Ki7+UrJzuWTkUipfFeOjpzYpWLiUb5tIWMJ38pMy3e18iWkiz4JuxqKwDw0BAlhWUt/srM=@vger.kernel.org
X-Gm-Message-State: AFuF++moRxj2h3gCdUzEelEM/lGcqKsFlsAzK0+HR+/thkzzFKZxKig7
	68jcoTxlHE1R+yDI1cLV/UAbK1ImV4LayLFRm/gQtI/dbJq62pE3lL8ahjB9L4523FrrKg5MF9l
	gUB9lhwG4YPLSetRXCcC1DOMxmmKqhn/KaDp7af25
X-Gm-Gg: AYBFou1TAQl4k14gT/nZPkje2bIULXiqKsuAakUdXMx6UmKQSsWp8s/xHQktQ+mN2N0
	VXGBFdBgOs3lIIWEU+ufZnwJRCfVFBlSo1GYeRaLMWJbfJuG0G9InfvOtHgK4AJGR3iGekfRS5Q
	CrJLUGmXILRLuworkFWGfi3esHpz+PwNCkg6R9q+pmnm574keEULJ6YHsDWhpqIQxE9mMhsEVPh
	QzIS9Besp/L2la1aDwwR/AkyVmbe1iVRpOSSj+ofWooTNUITXZ+mZq6saIGjKRUoPKhJDKPCGzV
	f/HCFMSoZO8qHChTyZqJnRSy7jNbCU5T8Ok+9ee5Cd9KyqTus/UFyeaMRS9n2+2vok1G/MZboeJ
	peohDgrnr8XgWoiy2IO7MbQHfj3bilnA/vQbSgWT7TotjevkWMPd3v0/kP018S8H+ANw=
X-Received: by 2002:a05:701b:4187:10b0:143:4d12:396d with SMTP id
 a92af1059eb24-14d32fb9a44mr3389493c88.26.1790829241124; Wed, 30 Sep 2026
 21:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com> <20260928-work-unix-passpidfd-v3-6-532018a91b21@amutable.com>
In-Reply-To: <20260928-work-unix-passpidfd-v3-6-532018a91b21@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 30 Sep 2026 21:33:49 -0700
X-Gm-Features: AclHuK80-WytqOlhQ_cTt40E22rT2LSFx63QxmMEJnVWBKUyH4pl6_lj5c5cTLI
Message-ID: <CAAVpQUAgB+awkOOr6BdVCMVfNJ4tS0WrK-vT1n4pecz44SxC7w@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] af_unix: record the pid of the connecting thread
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:27=E2=80=AFAM Andrew Halaney <andrew@amutable.com=
> wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> Currently only the struct pid of the thread-group leader is recorded.
> The identity of the actual thread that connected to a given socket
> cannot be retrieved.
>
> Add the plumbing to make it possible to retrieve a pidfd for the
> connecting thread. Nothing uses the thread-specific struct pid yet. No
> functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
