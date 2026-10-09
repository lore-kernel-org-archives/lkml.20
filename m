Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9525B087
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791508357; cv=pass; b=l31WhKDNup/YB8P7oOLk21p50Kl3dZ8CZttyghPBfZ+KIDU1clY0/vjtdrhCRVMJxNdKt5WrQZxsBkl2xRpnHRyiU/VW0ODge1Ct7dIjF20+Fuwwe5R734w5GdFgrMb3T+befxwFHzpZDIXn4jlJUpDXSjMQxhW2klLJM9bYIPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791508357; c=relaxed/simple;
	bh=2bXMDwVEYUSw/XMXG+524Ph7e3RM6JayBzXlJizXsCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZhmZ3Q63m27FluLcfsEPL0FYTZS2bUv5fGiBGLafLUt0IFXVK4XrCtpWCkAbEhSU4y59cCmn/eP9GyYOcfUdRitWdxAX5DcX77qSl+eZ/P+UbRZbcEwbTAcGFtrAX5XJ1HoVEul6GWAL1pPwJDEf8V4SE1lbTPeC0EiFi9w9c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR4OtYHV; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR4OtYHV"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-86b41d77a05so1715312b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791508356; cv=none;
        d=google.com; s=arc-20260327;
        b=gaqqPLgNFO+Yx82tKGKyaxYn0yRtUl3vgfRt6uk7MtkR2kVy3JTg2s8E2zKQCoaGjG
         EGerM50zoq2wWjHfHS5Qd8dL4ZKkrmwKSWiPA1n/vKWkzoTpbjhg4hH0m17ZdNDl3Wvl
         smN1sBQ24MiLaBQeSucMGrA5Q+V+vAWxJ418HJxDv7idB4+ydnsLMbTKq3kvG9ewD2KL
         Tk5lZC/SYJSqVnz37yiHwY7cY+ALK69/8c5dW4ksUhcKlpr5Pi3B6L8RLn3dl0ciMyaR
         P6d9Pw7wsrJTbqULswa8P699lF+N1KXQwyBtuDcTpdgravRyfljPK7DVBkkITaiK51o5
         2eKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rhKDa4MSCyA+5vwLc+awp1rXxilBjr3kpw4ZExutEJg=;
        fh=86WOW3+jUKKC7XORFL3TFAdNy/CVZHMp2hcrvxKm74k=;
        b=c86LWvw4cwY48Olm2UvOMLRd5DnQYE5zFZf5RDg+UN1JUVsNITdhO/tjlrPm6KXHFl
         bH+ZB6LEV2uKe8m/O4nIQIdhMtRnQAq4kg9EDa+4pZO+zILfiywPVH1tRGj7aeL61ASC
         4FbS5DotsAxLkm/1juOIoIFbxTVhBPDwyjnCIpCJS4nWdpbv7RQT515VUKbJyw5hQw8q
         rytk4OV3CvpNulBLfXsJllJuJ8uDb+3mpA0BgnTt0XLsuI866mdFcwWQGIjSxE8QALnv
         7OH747PPJiVCkftTe65nDeuceZKhZtjulonZOWcfc5sc+U1eeT+6KHNx/r7WxkLK/B9x
         PR4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791508356; x=1792113156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhKDa4MSCyA+5vwLc+awp1rXxilBjr3kpw4ZExutEJg=;
        b=cR4OtYHVgcibPwmHiavkY/FAB5ENYmg/QDtUb/1IryRfPVgKg+ubFht40ut4t7WU1A
         oMqT9r3HYcVBB85yVxtVOy+JF8zVQbSQCJ/oNyWKav6AaAAZGp5yD4DAyMHMk7yLWJ6B
         Fyao3AgC7Q6btwdwe0WMjciuc6YHmwdpZ8Bnq94uRN/Ny5lpCCSv8RzNaY+ZjbdK7Qxi
         NwnCnTgc5Hn6lD+hqrlMr7btrpWuR8KYiaUOVKiUIZJ65r23Liw+/d9CqtFIgkyp5gwR
         nJO4tV132WxG9IpaKgxRj/rokle9+w8AYRVYyAcNHy32PbwSiux8B4Bc58QYCHsnC5Gt
         wzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791508356; x=1792113156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhKDa4MSCyA+5vwLc+awp1rXxilBjr3kpw4ZExutEJg=;
        b=ZXau/4FPZ82vcvzSB8+MS4plu3/VRooRgmWobXnH3Gzk4jZTk8NlJGuat2pJk4ZYbH
         bX0CKNyDMjxI1s8yvQuTWv649wbVIqtVyK98zqwL4VjbhTeS1AmhaipQJ63ggkU4UhIo
         FE1AKdnS+b93gLIbx7Ct6p4/f19K/j1fur/Udb/dv+zeCggqdoXioHLOpWoUU5ZxeA2T
         t6jCwhrQbel13Um6vOLQhFe1sqbKQEnsvkjXevX4CUomF/X4Bxqi5GKXyyz3WC53AT9o
         q6h5AOJ2vbxTtEo67FPsC9uF2KNkPrwUtg7e/AdF1xUSqJrNN4Ny9u/RdAI/JZGlXfq6
         LCvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBqTXhNVKVJEMacP+LCekgNCUu59Nn35t2XkijJTXxtLrb5PqxYcxpqUv+MdN2nbFHuf0DnWOv0ZZ1+oI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo3nthTKamfvqxdFs2/U5H+XBLeE5WlgPbYpvRQcDYe1YyEOoP
	oMDG0pfl1csQoYisyt1BThXRvNeZexqJ3eO6Q+yYld1eFe3DyKfEiHLHe/qjYzKhU0PTgSy5zAX
	E87mfGHDXiv9sShbjvtI0tJ8Rcn1Ayho=
X-Gm-Gg: AYBFou3sOlbnWstoEplGeHn1mv1D2haO2EpI4K8Ay2ELoALv5W+PojEOHkyEvjov7NW
	K9iBSC4NlVN3Q3TtFB+Tadjin4kuK1eFi6XFiVzcZty1XF2phiN4ijlsX/oVsYg/BI1YPXrOIgK
	xT9Nv4hgonwHEdRNXcX06mErIeaxK/y3IFh5rrwVYk6oekmuMvWu9ghZYUAOD6Wj9phqCMSrFlB
	DnNM7RY+Z2AH3D9SePULRnBUBK2CNb11w+djZJaVXxBIVNXrxVO/N0dyVDj4bep9wS3RkLynZZx
	Ad8kXNW6VG1+p2AronTHsxDrsTXpnJPeInT2Mf83tHuE1Oqi+ugxcwVNVhLLjRA7AudvbSYY6/A
	/np4xg8shCQlUulrx56ro/Jqugwh95paMDuC3xBWOIumc0K0HhGeB
X-Received: by 2002:a05:6a00:178f:b0:88b:72d6:b80e with SMTP id
 d2e1a72fcca58-897c5d55bc4mr259823b3a.13.1791508355601; Thu, 08 Oct 2026
 18:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007035739.3472432-1-4ncienth@gmail.com>
In-Reply-To: <20261007035739.3472432-1-4ncienth@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 8 Oct 2026 21:12:23 -0400
X-Gm-Features: AclHuK_m_kMGuBUY_F3PNA9Ts1xvaJcfDaoJFu7BhbCtEygkfb1YNmNxMxISybs
Message-ID: <CADvbK_fEWi7XFJgU-7Zo_pQ-a2AiQoJZHs-jhspYQ7xgNCKNyg@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: revalidate output stream after association
 connect wait
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:57=E2=80=AFPM Daehyeon Ko <4ncienth@gmail.com> wr=
ote:
>
> When message interleaving is enabled, the first send waits for associatio=
n
> establishment before building its data chunks.  The wait drops the socket
> lock, and handshake processing can reduce the output stream count to the
> peer-advertised inbound stream count.  sctp_stream_init() then frees the
> extension of every removed stream.
>
> The sender resumes with the stream that it checked before the wait.  If t=
he
> peer removed that stream, sctp_outq_tail() later dereferences its NULL
> extension.  Fatal-oops policies then panic the host.
>
> KASAN: null-ptr-deref in range [0x38-0x3f]
> RIP: sctp_outq_tail+0x49e/0xaa0
> Call Trace:
>  sctp_primitive_SEND
>  sctp_sendmsg_to_asoc
>  sctp_sendmsg
>
> A range check alone is insufficient.  Stream reconfiguration can grow the
> output count again while the lock is released without recreating extensio=
ns
> freed by the earlier shrink.  The stream can then be in range while its
> extension remains NULL.  The send-buffer wait has the same issue.
>
> Factor the range and extension checks into a helper and repeat both after
> each send-path wait that drops the socket lock.  Once the lock is
> reacquired, the validation remains stable through data creation and
> queueing.
>
> If validation fails after the connect wait, the auto-created association =
is
> already established.  Return ESRCH so the existing caller path keeps it
> under state-machine ownership instead of freeing it directly, which would
> leave protocol, counter and socket state inconsistent.
>
> Fixes: 668c9beb9020 ("sctp: implement assign_number for sctp_stream_inter=
leave")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>

Acked-by: Xin Long <lucien.xin@gmail.com>
