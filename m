Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1933F38A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791435832; cv=pass; b=ca0exr4ZT65GXPB/u8uBXXPhZ0ELx5aKw02Ib/Iko5Jn7N8T9McfaCH1vQc0r+lReLL4yVadOO1MohP0P9PwAKOi+aXTE9aP1EpbOSpSgjaHSPl3+vhIiEzbndVmzj7PpspC2EIp5s5crZL+kD6G71lTE6rJOXqpEqBXhqRf3D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791435832; c=relaxed/simple;
	bh=GjoeoU74ZYSuGHxDYSGRd9MIPo/RtdO0E0uOpCYv/0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inSJDGoVJgOWVPB2+vuDqNZjryuLkhdHJatL7ympFnqFrXjAo1SsEoIdbNB9QfGnb6L6aOESRMTDT2knnOLK+Q6RuDlGrXorxnXPzIUnlV419waOFM2iSa6y0AGeHgYNCu3YAyFUkNKBEqqGsPy8HUU3GRWnLwQ742B2yXJNJYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UIKCFgt4; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UIKCFgt4"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-150f88d22aeso1779118c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791435831; cv=none;
        d=google.com; s=arc-20260327;
        b=VjbgtDn2zdNXDbHoJQYjKAC33VvXG+9BpHYt/qfCc5utQOzRyxBUNcLFQZBkynUGWZ
         XzgWXYKZjsbKJ0KP7BGEpvjMlOd7TFk/daYyut1sjPuRLFr0wH5+ffYij2xtbT7XFXHq
         uueFeDicCpkouVRJwawgtFI0WOom6pEyW3ElTzdElbhVG+XKvkFJLkNyZenE7aV3vg4j
         qGm4t/vOdutEMHHY4NHxv16+HuqzFN/woSj0kI3olisPmEu84ytlpJZ6g2uCAmoYGnBy
         eFLOCmPwm5X9I+qfPdkMWafhnlpEEUonJKwX+S0XzcaH3nNcmPaDJBLSfePKGF6Aq6/+
         JUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjoeoU74ZYSuGHxDYSGRd9MIPo/RtdO0E0uOpCYv/0Q=;
        fh=UmsYJfOWCD3IzB0o/49qxainKVbxdB7qgzh/oH6vC3c=;
        b=m778Od7WsGgU1brB9rE4o/weI3kUc+LtASAEdizWGWVp/51R+uoqITnlcc+CQjBh/8
         4C0FnD1tNnx8YfmUHwbikfFQkMUYWogddbEeQQL9RhH2yHdT3ySZbB+1IzTt4ju7UAuc
         2fLn7cpgIdkv9o46g+6W5PeH7xWQpcP2qcMLei90mxgZuCSQhpppafGQ9/TDsNrJH8LG
         Ts4nunP5i7tmHJmUiKGZFqzw2JaasDU5yJ9+1nVe8kODuzaBWZFORzJJ0DvNHXjZv56L
         UoAT+1JK4KOlQt4heqxi7UdDod0ZqUsghlqK34i46Z0Uo+jcyU7PLfXqb3ht9v7xMdWS
         Qt2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791435831; x=1792040631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GjoeoU74ZYSuGHxDYSGRd9MIPo/RtdO0E0uOpCYv/0Q=;
        b=UIKCFgt4EwNRHy9YlZUf7xhlnq5U5rrmiljdpYNahl/fK5tHJhhvhXG0h2gq0Ws5C1
         2wJmNDtv11jQidwVKdGREFAkf57HPxgpiIWKpdmFsMXzUXeGwF/mB4yd0s3AN6cGvDw9
         v9Ur8Jk4VaJFCQiTGX4Au2Tw+25mkg5v+oLtv0Rp85YFCv5VnxvUiJM8heqjuoJ6OmEY
         B8LQPcPHgF6xJtLWncWRAYRmojdldBpF99LFdq9onwuuL9uTv8zLDaEAhKVxh1sD6rU6
         StvB72OkJL8K+eE2YTQr2RBRiHKN7onz37SDUIh+G1/Lv0JW8jIIxsXIwK0p6iassLLK
         n84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791435831; x=1792040631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjoeoU74ZYSuGHxDYSGRd9MIPo/RtdO0E0uOpCYv/0Q=;
        b=CpFyCkV+oXpGl1nzr6f4qPwJZdvkuTdl4jwVR+U926nf4bRahIdnrn5IggYdCNOtEy
         QN4egK/rKT+SYIssyvTj16UG7lj2shOaMrXtlz3orKOSY5cb159WKO/tSAJtzmCcuB26
         0i5t8z3lg61TVnd/xO2NSceyhpKygh5HSN5BrejDG6AbEjNXgl3o3Zs+vgi6Sa6w7z+k
         Nf/8B5uvlgt5bYSNGjObpvuf1uij6jT1sWiZsIXEQ8h9BFZroHOQo+jCbbWmOQA1uMmD
         IXM+r6QU/k4MXlqEZTk3rRTmycT9agavXfUAoWqbe7DI6lDblE5bMxZYiq4KD4SO7DBX
         hueQ==
X-Forwarded-Encrypted: i=1; AKwUvBzayyirlHnGj+swnMX9VWzj+Pxs0ohT0xWeCYmmxdTi3ODoZqFxPuqkHcFAaVy9JgMNv6tRFu/99NNjWnw=@vger.kernel.org
X-Gm-Message-State: AFuF++mFFzvvkdV93fws9e28a4/0d2lzsdu/TWWSltDEVysNa+OUuWGY
	MBj3IhqtzbrnG6grHzWLrgaNBWHGf0Pp7IjN7qoy/NaJbU3arWKDZJ1u5rCh/zCS+xDh1vB13xJ
	5eRKReTm20GkZa/P+se1aIqv1yvKiInVyuBkJe1Iz
X-Gm-Gg: AYBFou3kl6ljZWtKMNmfzw8skNMdbO+zPDEzPDao4PAbhnqn+zOl7N/zcjtuu8/lhH2
	0PmN/UQDq9qfGNaCt5bXRKK12egWpPXCs5pwbJovMRUjsJoyHBoY89ZtjhFK2+Ri2v6kn7pmij2
	dAWbFwBCt6TBtG6pj5OPCLo2NMEOKlcGWI9jKCyQ2P2n0wQSRE2pgmkJ2jNLEN4AzhCaRzSbmSu
	iMIS8J60OXLt4/h29BqinLD68xN4FENQ6JQ6kamD+wGax9m1uCdaD95rBokdZoDllxo3J8GFO9w
	nz4nybLevi4u/WhDm8OCmomnbVxKfZ9OP844oVNwXAMXoCFC7wapraoI1/OubZ65soJFBqH+Xrb
	TetNCRztlyc1mDGdUMpNcpu2AcljfCYnU6XYDbgiGtX8vdW+GrMiHKPF0ha5jNP8Rav1hRA2G4i
	z4b8xDOF+2Cl1QVNYfcDI/NtxW
X-Received: by 2002:a05:701b:2602:b0:161:3942:c07f with SMTP id
 a92af1059eb24-1620a9a5ad6mr5199767c88.47.1791435829062; Wed, 07 Oct 2026
 22:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-work-unix-passpidfd-v4-0-350183b6e02a@amutable.com> <20261005-work-unix-passpidfd-v4-4-350183b6e02a@amutable.com>
In-Reply-To: <20261005-work-unix-passpidfd-v4-4-350183b6e02a@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 7 Oct 2026 22:03:37 -0700
X-Gm-Features: AclHuK8bNKhRRVOZdGlnqbecyJoiNU6TF2RIFHGHC-yiG-BKj77USuxK7OP9UOM
Message-ID: <CAAVpQUCK-AAQWMP3nM4maaHAVE1hvh8Dt0yLBhq9V_d9CVETEg@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] selftests/net: SO_PASSPIDFD_THREAD
To: Andrew Halaney <andrew@amutable.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:09=E2=80=AFAM Andrew Halaney <andrew@amutable.com>=
 wrote:
>
> From: Christian Brauner <brauner@kernel.org>
>
> Extend the af_unix scm_pidfd selftest with SO_PASSPIDFD_THREAD tests.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Co-developed-by: Andrew Halaney <andrew@amutable.com>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
