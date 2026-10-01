Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1529992B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790828388; cv=pass; b=XysSfA7ug6dZ5ljx+XbpslPaECPWlZaVfiGPtUWbgOQXyoq1cDOE7oBB2Y6+NEwjG5nZQMQd4e3hmEhnF8UjjkajsTcFNvhInOsDtis4nx9YDmLR+g+AdgcqHPmcZ2U6VjCixr4TguyHyM9O1AwLgln6h5VeJIl4vOsSds5zB3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790828388; c=relaxed/simple;
	bh=NlwyKjfoR7VaJB7r+rozJPFGwYih64AWsVmx8RjDE44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDGtHlqJIRmrJ1YmMG08rXq032mt830ifyLx2GzME0Q47tHiwvU4t2ptXQzncLTm0AZ69ZHfzkqRn2oqz5bZGc545U+gq145XCIT0yXl6KcSUXM6CIgdw1WpgF7fjKZV7NS1rY/fIsdDYeSg91PbU9rmAUJYX6bNwErdGU+cRsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=At9ZnfEx; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="At9ZnfEx"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14e1fe551c3so228997c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790828386; cv=none;
        d=google.com; s=arc-20260327;
        b=I5f9tzCW4/3bdjqlMfq5lTornvfZ0jJ6eplCHxBCAXrybRmTiqRPIRBZXnzMGVDMqS
         DNOTzS/tLofMxFM1C5lT62VVVdwJ6Vlm11IWFsoM53C5rRYuj65MT+bfQAciqucl6BDF
         8Fgd2PONj5lJNUZa/P1rTtcrKRmn4QRDnOLKS7+JhJx6+S3soHoDis5dm2kaekZcAmAD
         C67+7WlH+pg26+j7dyuT7PUtg8KuILoPbt9Kp42aGNCA2Uek30qQTY4BxRgsSOfBOONo
         H/MoZ9ASXqrlYsMeqIqF9srLL7zyTUlruqrvJAsTvCniEUXOeoaY4cIsHlgucF/VLpY2
         U5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NlwyKjfoR7VaJB7r+rozJPFGwYih64AWsVmx8RjDE44=;
        fh=gkQBaE0khShKqGcKNnpW4WzEd1o78VTZBxTOoEQoaHk=;
        b=HqGdZGZbh7NyKkdQLiIpzX+D2qYP3vpgULuCth0dDBpDKOtm+NckqVvisGNoFgWAVF
         tb17DlGKqGX7bRiyPk15Q17Hv5pU09pNoR4GXPLgO1h//aXJP2ZILRo9gAg70/rshSa3
         3b7nbs6+IYY8lIIIwZ4Jetn/uWETCEiai5Dy6gJ/gO45Cywi1kyZPlJnhF5kOZmAm7sS
         Jn1ruTdtT9Vq6fJ8669jYbFXkQ+ykQ/QuyrUDgL95sqIbu52kkmF8x9ZIKwH/POAzGZr
         qcY70KyutH6KnOVjsP6RHkOSpBhiOlgleYFLNmkrVuJDMsc7FA7n5Am2JvxFGz26OW+j
         BYCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790828386; x=1791433186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NlwyKjfoR7VaJB7r+rozJPFGwYih64AWsVmx8RjDE44=;
        b=At9ZnfExHujoIhNB+wa6M0lOh9U8VhD8zTm5uX/OubLyt+ZaebZGM/MtiV/Jfcm9XK
         9Rh4ReXfP9dWX4NP1sgHTauMAgce7G4sKibYUzYQHjD5cthnMNOvwHTziaPvPfgr81HP
         gP2O1Tc65OgX1OAFopc0pONQb+sUZldN4/GvMKBmvnYVNM1hlkLf4eLDD4WCnEzq/uhW
         KsoEGSm1oOz16o26RHoqaKzrfEIyOVKp2xw+8MYvGN4vmteZd9swI+UY8D5l9zCHMgou
         v3eeQSfqEZ92/6lVprr/lHgvBKCC9R5eNKExpzLGFvb4k9cO286v2Mlx03D4qNxxaLI1
         FJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790828386; x=1791433186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlwyKjfoR7VaJB7r+rozJPFGwYih64AWsVmx8RjDE44=;
        b=KXHsyPBcJ6x3IStjYCGphbEtvGIp1tMA5Enn6qTs1JVhEA2uyDiVoT3bvWGCijYaYQ
         bHc61nOf09CGKh+PbyqqHkLN46ge10AEvrNkMVQ1LfTTXF4qNuKQRwHwIK3Nvqy+iiVF
         /WUqIxautOyMcC2tsaqMimX7V5I9EbTGgEIjbbQOt0Hf/kLbqdY8jtyckWtVcWtKOvAQ
         1hIrJWxFIvht8b8up88m++VhUGQeEs5qBLsWCUXU3yAQE2bb5KLZjRj6y8RCN2nhLViF
         rnuo2XN7yrl2zvjCJpPsJHJXyA35UApWIo1w1GMOo8U/8XeJOQ8pTsfkdNc17hRgvckv
         HcGg==
X-Forwarded-Encrypted: i=1; AKwUvBxCnYRcguLFGavka8594AhM3HVDPJDiHOnF0fpJTCBnQ7sa8TeRzysWJfXl4P3Uf3GEfuMHC0UBnDS/N0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kvNfKu+6ezdpjeGHJHkNP5WOT97UaWb7xul3Vlgn07STpP1m/k
	jfyUWlZc1GiYUFkyYRKxGOJAvgSLESR0ZESJdCifQ6nkGnTrckPgb6siiVwpQ0CmBpCGfbxC3lF
	xczlqUrz8IjF5U0j6E9oHXw7/lQ35HYEnonD5mc5H
X-Gm-Gg: AYBFou17FEUL8Rr10I8CsSK2sksqVGWWlcL5EkytVtNp5IL7QY+g3aqd76CPCew5eoh
	gzSluL1JFdOjeNxJ/o1KM8YV53cJP/VVPdFflAwZd89+U3HFzGnZkehgDmizRK03sE4xAV5u6Kd
	XLQXlcivtz3wzN4aA2lUhRXIcTSR7xV49GH3WCp4+5UR5tFNIJOnGo9l4/+pp1sBB9K629i3HFU
	Li5r+EP48Exf9uDRa08xQHxymByYaLvzfq3OpWTL7AohqmtkoP8LHrQAJ+K4lb3Ej25D12/JQ8h
	ZkasCCkh3Wk74IzoIsQBNEpjtsRXK4QPRU72OwSZGPpfbUF50UJID2t6GOWer6tw5sxm2EZhsGJ
	OzLY3K945lBQnrgDpJ5oYGn1QcZubOS+sOcqUZfyw+33qKutxRMX7UBBd+L9gWFA0GfI=
X-Received: by 2002:a05:701b:2406:b0:149:1feb:6da4 with SMTP id
 a92af1059eb24-14d332a2be7mr3924860c88.32.1790828383999; Wed, 30 Sep 2026
 21:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-work-unix-passpidfd-v3-0-532018a91b21@amutable.com> <20260928-work-unix-passpidfd-v3-5-532018a91b21@amutable.com>
In-Reply-To: <20260928-work-unix-passpidfd-v3-5-532018a91b21@amutable.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 30 Sep 2026 21:19:32 -0700
X-Gm-Features: AclHuK9j8Y3QqvxsWyBt02R9nnTt-bXIq_uC7eCGDMAC8dhm7oM4Sg6AFvi_bSE
Message-ID: <CAAVpQUD69=MBzg7QcE_9rhzjm=QO_Jp=WU+z=ihFYGPoawrR+w@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] net: turn sk_peer_pid into an array indexed by
 pid type
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
> Currently only the struct pid of the thread-group leader is recorded
> for a socket's peer. To make room for the struct pid of the thread that
> called connect(), listen() or socketpair() turn sk_peer_pid into an
> array indexed by pid type. All users, including bluetooth and the
> coredump socket, keep using the PIDTYPE_TGID slot.
>
> Nothing fills the PIDTYPE_PID slot yet. No functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Technically, sk_peer_pid/lock do not need to be in struct sock and
can avoid bloating it just for a single user, but I can follow up on it.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
