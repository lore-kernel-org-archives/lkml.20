Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA5C40A956
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765002; cv=pass; b=Pf1NrDsk3qA01+skyMlMO7Kc60JMWuuZvu0Zxpcui3RQEc+EUWiV3TDU6cZNEgpbwMpRbfMx+91oAmN+o6KzptRuk1bXOqLMmsbLXNrJUIiF4LqXOemuT+ybqp5a1lryjSXKyXJClM1ccmsAoeurSSGQDHUMvTqX0nc9KyBMyQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765002; c=relaxed/simple;
	bh=bY8T7KF0qJSw0FCfp2fmHHR9P2/vJUU2JRlv2EGdr60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMqKUSE7iysHwtELSqpsgeBRBIRlFoCjr3X+YwjdR7nluVvrZucU9zgGatkHW76mjN8W1hCd/Ad7hOeWWv+GwuJ5doZg3cZq6HtcamzM43GJWNrgU8l/hjEslhUxL1VW1Sx2bFjUu3E2eZ3iGRdEgng9DJ2nSHjz3ILZxBGTqtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DNDwjwAb; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DNDwjwAb"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52f83889a93so36179881cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788765000; cv=none;
        d=google.com; s=arc-20260327;
        b=UMzeFpFgd+vUlYt9IMp5+oEbFBeKOxqJV492LOFZemHHsd7FohlVPTO516u7TGPf/p
         50yMyLOWmzhJ0OUmJ9zYPzD4TCIaerMJhvU+//OwI6b/bHlPxMjeWvcwhXexfn1xW0J/
         5cHIqRywrvU5F3YrRVaaJnp/6U8Ss2zfbnDrVLzAqeamf10g1xu7nmv1UUJnNFO+y1LC
         jTGoNgT/6xKGEHyzUFfy/o2Erc2RO5AaijlR0q0iS6WCHLUlTs7pIPv9mUcmOZmwrqo3
         swj2O02u2/rsuiAJ1woFKIWfI+ivhNVe++C1WeMYflrD4JDSJcdQSuqOQFX6qdEYfNaX
         MB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bY8T7KF0qJSw0FCfp2fmHHR9P2/vJUU2JRlv2EGdr60=;
        fh=xyFQJFEsYdVUceFmdPR2rGqSVdvGv8othV1SG3nxZ+c=;
        b=ndoREIdeAX1FMI7+mldfbvTn9McVEUEstmDV/TfepgFe6SwgRoIRJ7YyyDg2890eyP
         Fev0CkmRB8IToVUSJlU30S6LBvAls5vAEoufHpIdJK8ER4axd8o6skfocx59TtOcMxUk
         VE1gN5lDKv4HtRDjZczlAmpd3zDBiM11Je1SKIZMO10kyMKDbDtUV98Z8EZuAb+snhCQ
         mF5n7JxGVOTtOHzFJe8izHBhRIuJsyBFvY9h0SH2y80Tnq5WQn2Osdkk0WJHXa+V/zM1
         AaGBfIRAGwsPDQr/IRiRy+0wi5PwXRJ/1HbWnV3UyT5OJx84+6oeQwcHAC8Y/rcBGBaf
         WLOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788765000; x=1789369800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bY8T7KF0qJSw0FCfp2fmHHR9P2/vJUU2JRlv2EGdr60=;
        b=DNDwjwAbwLxb/vjqZoJ6266SI9OFz+CRF20kRsRaVJQF1iCzpn8hwIZOEdh5VxTZFm
         ue2qn5tjAgvNzIU5F2Tl+JsqdGB56h/wwC536s3/ZAf8++l17XanvmPxS5xttFqpnAYL
         FXScekSslo0iG7S03As+qjFZgLjY5YNAgYRQsiKi1ATQuka7TktN/3BcmwsKodS3fnMx
         DqeiaIIGei+5KOcvV7E7SEPPFPcsTchO7kXhI7DeOJmWO3tNqIv9IHa6UhXF9UeerPC3
         nHkXebvBvxJl+4sN5kw60OfI02aCZvsHc4eXW7Vi04ALTrk6PsVOKCF7C+s7pQ7D0xZ4
         kinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765000; x=1789369800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bY8T7KF0qJSw0FCfp2fmHHR9P2/vJUU2JRlv2EGdr60=;
        b=l3+2J4r9yVh5f5X9tKNiTjfL+Xvl+/PQjBkplgc20p+cEXzKz82M0DniV/03iW1nSm
         S3w46xhmyMfLrsPbP/54L7uqVbZH5pCyPW/TG2GKWZELVKVWKICWd3Gj5cm3IebsaxRp
         /VG3J6Xg/W/6lr8wSYAArsJsQztIHD5D+nZBzneBcX9/ZKMC7Bg8K5bbcMhJYr1YCrwd
         AwZ4Gqpg1yK3ktg4pKH+7BDnNg9TfU3uYjkfPCcE3Z1oibG5kvDEJOXcx0t67XT156rm
         G5O/7eNeN6mgFGkRW6jLvv56f6BU+PPx4f3DHOPHZZ59S28OHG4joeopXfy4LiaiLild
         oXSw==
X-Forwarded-Encrypted: i=1; AKwUvBxGSRAj700cwod6BzCOL76Owt7s1wDXjhIoWhdOwxfGPM7jsMnHDeGWfojUQDHzAqic6t1DJIE4+ZX3RL8=@vger.kernel.org
X-Gm-Message-State: AFuF++mHiNXz0aFHBU6LxYIfCWUS49+LCgmmdx2jJzbqUEo69FTOOM1k
	3z+z+4qePuL+bLNbLwPHw9DJSQ1z8h9Yy8c6NtcABYJCyTaeB2W0v9sP0UIue3H2irisSW+yoTv
	7X1YluFyLNxMWSaGod8CVPVmXqC8UyLpRNdacpIQVcbE9IJcPX70G1c185ps=
X-Gm-Gg: AYBFou0IDDNWZRPFgI7GmzflKg8eNlTcRNY+afy/jkWRaDakbEdfWxzSLw8+V62fHnm
	GPUoAf5JNk7ZgeQJSPTaWwGa2KJ0sU6TsJAzyVCeTCzQOv97RvAp5Ep7MY4Sv/8g24hmeXvMl8W
	SQGUD1wXHUvNB/V8XBWr5wmxm13WzfhI4kPYU3y441aHE85Vaotc61A512J2DAvtuFrSfEKjkJJ
	0NWHvYyZAygDuRw6WUOmm9Chh/BlnDtdYKuAWPLjiFig3/wb8GBuDdwylpaNtWw88EBDZsJGXQv
	PTTf3aBCsSEiJspS8QCFgkh7Nk7Bq7UN8Ir0I0lfEC06MkubAwcmmWUK1EvoJzpPJxTTcq58ycH
	wf4ZdbJ/SSoXKIGlplnIT70gUQPKT+7T8D61Rbe0386hnuA+Zawo/LwZLMsOfJpXTkwjx
X-Received: by 2002:a05:622a:1f98:b0:530:31c8:a302 with SMTP id
 d75a77b69052e-5305495da66mr256081741cf.23.1788764999462; Mon, 07 Sep 2026
 00:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788248601.git.zihanx@nebusec.ai> <db1f34ca8461c7b0dc5ec504ea1b99c24b909e34.1788248601.git.zihanx@nebusec.ai>
In-Reply-To: <db1f34ca8461c7b0dc5ec504ea1b99c24b909e34.1788248601.git.zihanx@nebusec.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Sep 2026 09:09:47 +0200
X-Gm-Features: AcwNN1UdIl3PlzbDUGiFbT4WHqVNX_a67HKQKn1qGUPRwr6NlLZpE3hbS-2nlZ4
Message-ID: <CANn89iKzChGpDLsJ6iKRsMvHKdW6r_9xvkQv9g6bTy_-Pt8xOw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] mptcp: diag: bound listener bucket lock hold
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mptcp@lists.linux.dev, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Guillaume Nault <gnault@redhat.com>, Florian Westphal <fw@strlen.de>, 
	stable@vger.kernel.org, Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:54=E2=80=AFPM Zihan Xi <zihanx@nebusec.ai> wrote:
>
> MPTCP listener diag dumping reuses sk_diag_dump(), which executes
> inet_diag_bc_sk() before filling the netlink reply. The listener walk in
> mptcp_diag_dump_listeners() currently performs that work while holding th=
e
> listener bucket lock.
>
> The time spent under the listener bucket lock can therefore grow with the
> number of sockets visited and with per-socket dump work. The resume state
> also requires later batches to revisit the bucket prefix.
>
> Fix this by collecting only referenced listener sockets while holding the
> bucket lock. After dropping it, re-check the listener properties, obtain
> the parent MPTCP socket reference, and call sk_diag_dump(). Keep a
> referenced cursor so later batches resume after the previous listener
> instead of rescanning the bucket head. Validate a cursor against the
> current listener bucket and TCP_LISTEN state before resuming from it.
> After dropping the lock, read icsk_ulp_data with rcu_dereference().
>
> Fixes: 4fa39b701ce9 ("mptcp: listen diag dump support")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: Codex:gpt-5.4
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>

pw-bot: rejected

Please limit the complexity of filters.

Anyone needing complex filters will implement them in user space.
