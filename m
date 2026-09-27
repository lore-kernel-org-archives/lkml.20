Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A854738839F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790475819; cv=none; b=jripLeKaC/1e174BbLS/r/2x30wdPd5tOO6XQoo1YNik6g0hm6w0jLkytkC0oaclNBcAltAbez1jk2+j2H1HUCqjEWGyxZeKbJUp0f9GvhgJzrX3a/trWQAy3NyDH0Z75+xLJuqBashkpr9hJFJyORzaJdOISAb4o/tfFni9+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790475819; c=relaxed/simple;
	bh=reNeOOXVzfXPjpIbTrcp6x8zksBzEAfx0mvL56+4vj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3cv6D2mLkMQpP9V64fZlZy6ZzYt7fe69FIpg1ZAXUA5vZSlXgU5Cn1tWkHG8OO/eNMKXEpKmVs04JiIbzS2TTOdPzkAxaeq9TrjaYgYkyCBC32Wrtv9eckNLMTAexlIIxYYE3w9/ys7Ca/4oTkdoWxODdRz8SG4dM5KM80/xcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTZNg5nJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTZNg5nJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6A51F00899
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790475818;
	bh=t0sd2WYEHNKUkojofc+b7E1p9eP04Ep5nooeYzFqgag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TTZNg5nJtkt7RYGLO6RE5zU/25f8GjXwhS0pkDx5OVDGPo04hUdr+qbCluQC9QEes
	 qiJ7kR/+ZcmG7u2rMr8SbysA0HSuy8hsv9b7+FWmiqdjLTMM4fr/lb7/NAxgGP5UoJ
	 KlOIX/BPTKjz9s9JCkbWBq9F02eZ60ZzhjZPaqWNkNwGb5EUnikPbYtcdvILyupHn8
	 MxF5zF/UqTA0iU10Ntw+IbqSRIr/tjin0nxsY6tGJtLFQtjUetGDG30xpQqxoXlpGq
	 lrP32pzt5POi8WTFesWBVqNIDQJf02Ei6o6OwRo53MuuI9R7fnDk5/2I4C0bitq949
	 jCiiAMs9CzrKw==
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so138050a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz5MgFAP6H2QqEmbZf3XyeVE/gdWIrREW54fp7MEnM8nd3P7xsQD2xumaMoXrRZCkc83K8IRfOwX5HIB3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEQZB0/QUzYmf26ulkkKN6NN0hd6inmTQRnBfwFC3b/yU/KLu2
	GuBWu7P0P5WZVR3QUdtZ4aCHWYabB94tNyIE3HziiOPdegDojvtykbQwxOsNMS/L9fwWvXJ7nRr
	aZQLtswJzk7ZytmmoJ71XmrhwXSfBlAU=
X-Received: by 2002:a05:6402:378e:b0:6a8:398d:f57d with SMTP id
 4fb4d7f45d1cf-6aacc83e309mr8161360a12.27.1790475813965; Sat, 26 Sep 2026
 19:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926132208.23360-1-zihanx@nebusec.ai>
In-Reply-To: <20260926132208.23360-1-zihanx@nebusec.ai>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 27 Sep 2026 11:23:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_T=r4doyNdeykejj4SsJHiK7Fv8aujt-fXACFybUr9xg@mail.gmail.com>
X-Gm-Features: AclHuK8IqYcRPOmdS5FFOdSF2W2Jugm1H1ys2DHDizlQVeQ0L2lg_0_gcJ6qYgc
Message-ID: <CAKYAXd_T=r4doyNdeykejj4SsJHiK7Fv8aujt-fXACFybUr9xg@mail.gmail.com>
Subject: Re: [PATCH] smb: client: avoid NULL resp_iov dereference
To: Zihan Xi <zihanx@nebusec.ai>
Cc: pc@manguebit.org, ronniesahlberg@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, dhowells@redhat.com, 
	stfrench@microsoft.com, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
	Luxing Yin <root@tr0jan.top>
Content-Type: text/plain; charset="UTF-8"

> @@ -1111,7 +1111,7 @@ compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
>         /*
>          * Compounding is never used during session establish.
>          */
> -       if (num_processed == num_rqst) {
> +       if (num_processed == num_rqst && resp_iov) {
Could you please explain how this code path can be reached? Earlier in
the function, if ses->ses_status == SES_NEW or optype contains
CIFS_NEG_OP or CIFS_SESS_OP, the code checks !resp_iov and returns
-EINVAL.
