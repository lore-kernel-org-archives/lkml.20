Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792525225;
	b=pzPp151f+BUyT25IsFiNsNepjwjmFT+FcLsE6F6so3tpdMAHCSgBz6LKgRRWk+E+xAlE
	 0jL8D5bUsd2dzVwYw63SN23m4xDY9zglTZ5J0HuAkbcqNovOIshYewrktr9RTSlSWNl1K
	 0raVXm4J8OaVJ3dFo2PV5qmLNlFa0ok92bfD8oAOGBXFhk1XkdsmW0RDnQmovZmyS7sWH
	 EjDxYWKxWJnt+UDRAJY7r6QXU8hhz0hifb+SH6/lOUI6syUmhijg2AssqugE+GVXtTDxe
	 SqPR4fDKW8Z6YnxZrrt6q9aMCfnob1lgkTgDaB4qe+iP1JjqcQuwqcbW1ADVVg7zweg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e4JsFSb02TA55hrw/5psLRJkNgQYlwZOZtfuBpG76qU=;
	b=cjtbCaJAASID7nsmhZTC/epU6V7LoMS+ZRTk/bIl+T7RPZd+CnakR1ndtU7agKFz89g1
	 pFRs1WaYnuM2bN+Wfkt+TKU6kDLZT+c+UK4n00FfZOurZSh5vanEiNffMsbf+H4Wt1rXV
	 ss/+fHA+Hur84wDpbXW2OiTvrAbzO93sjn87ASeSepR6EZ0MQ94T18FfXt+sWALIR0hnx
	 qS8R+qQdjmk+O1Rx7I/QrF7WelbvCAQkz940mbKahcTt4Me2z/6vFcyWQFnHo7DH3CjGG
	 m3vlG4mn+RAzqMms4G0vg0irW5DnxxRYc8Vo6HL3XD0XzN+bKba6Wwxbyj82rpqaitA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDq4O5Mz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C6606A337
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769C6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDq4O5Mz
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so59647b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792525224; cv=none;
        d=google.com; s=arc-20260327;
        b=PSgMDRgg02N/3MHKtsaRRCjOEml+8q+Yav7TZQG+g6S33mofR4W2hFl99I7oaZ/yFL
         rZ/iKOCTaZkv/epj9YkGEwaHTccC0vrmQG2KdMFFX/4X/V6zKvEETt7wgfpPBplyvI0M
         eoqjIq0svrlsqIK+FXKiZpWbLuYGEIBGeXvEqmL6i7NmMmL8ew3fq2rqsKfaEV6zlyrR
         58jpuy7WqGNjPzKhstVaFKZOJVRTI1bzbzo+f2bC/6elXW1g7v70Ok7TKV41lP4RkaTx
         uIFAXkiNPyJ57lDGvReoZ1Ul/fed4z1gZO5i6YY8T0sN0iVKY0GesOvuibTfgrTG8Gph
         Yy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e4JsFSb02TA55hrw/5psLRJkNgQYlwZOZtfuBpG76qU=;
        fh=s+tHbcIqi+Uj0DGSyUOoYEJbreP2jKo/uMuzgxNeIko=;
        b=MArXWKwFK1XQiNNFueFL4xc0VBKy9lgHF3JS5wWN5n6kyEQ3FkZRIiRd2HarRVqYEh
         hcfAV73kDTUahxnZvzWoFWpbxCpc/WHGztt8v5bGEn5FRSrToGDaCk2EYLeOKjLZJZ1X
         HlogtjfkeLDoCwgnhTG6BryVmm3wkJt33kt8XFai9X9v8lARotg/kNdSYDTgbpzWnKBV
         f2AHLmNVHAIvCxJbB95lS+AyHYs7oL79ncn7eywqkimZA9D2G2WScleoqLTJcsQiPmnw
         CgBddez7SEwkPfCWfKywhfGCwxCWh3HY8bBsQSKM1yGy6d/CpeujvWB02bQKrJrsvyZu
         AKcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525224; x=1793130024; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4JsFSb02TA55hrw/5psLRJkNgQYlwZOZtfuBpG76qU=;
        b=sDq4O5Mzv7SmSuBHS4/QTeRkTYRt6RhWEfl8ZGLyy8160fn+uTZ3CXqPFf2+79S0Km
         SDYJ/z7uhRxvfIcef2kxnQeREhqofAYj/xN5S7T8HuUi2RsE6a43WK8wm8sZHC42zGOK
         3sVw6jq/wurpM7z0B7/kw8EoYfjoQHgX56LbMfcD1yIcPiQR9LatgvbHkOKlx7T+HewV
         B50XErQ2qAWjhzE448dWlpZcwINXqVof3JTa5DiMoy2f77Rucd0+/yc3RmTb/jreNC/a
         iuC+FeJYjEkydPyNEuOUgY5E3nUbZhPZRd9NocGLCqbqHGrs3k32kDUOStaHJrI06Kel
         AcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525224; x=1793130024;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e4JsFSb02TA55hrw/5psLRJkNgQYlwZOZtfuBpG76qU=;
        b=GBQoEdZ0BlYlnRF7pTgD2F83dg95gd7MY2wsZFyyKD0/KDL9SU61+9vXs96qz2Es8F
         D17QBfHmgoikUgv304tvXZTTyCboJfP69jWZpplIJa1C8nskeM3QqDvB+hEoNO/r1uct
         ZGSm+zjoI2jW+eHvyFxTjLWgDXOm3nusU0cuV0Jvztgjdz9+tQoN3WNKjIjfo3+RzHlF
         x81+FpNRH0N6HNeFa+1QWD+13nXfqzFwcXHAE+4FHF4Kd4rBv4eDDlVxh7mTgcMIYIwE
         Bz1CC6UEDaWNL/3ZvsZBDPtZ798U9jpGSrFBStMEqYgxZv/Vd9qxHBom6JV1SdB50DHE
         54aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC6scQ5Ma24QbHkjyL7auedL/bVylxxKmQEnhC6T7EzhhTrH0peOTC49A5pyUNKfR5DmvXL/mIcS3wQh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo3WLQGd95ynIde12kQAnnD4y31uNNHaB26nHtSpX53OjKUmsR
	a8sVc3s0rOuZ+1BpV9eaDBRYu/Y9ve9dMLKGprv2XoCLWqZqHfNisHYYBiBFbLpqATuRFxAa2kU
	W3m92HZoab9IlGi3jQGHp0rl/wjlvNKU=
X-Gm-Gg: AYBFou1WolsFyCwFUXEzi2AtQ7k46XCbQ4HY+vv7C8cnp+YxVpMuFK4xzTPxI+2psct
	//qunXxgX6VGtDm7fvQl71wdJeAWdEDhOPYiMxYimJH+vtzYoALL1viX8McqUQs8qBevB5ob/ML
	XO6IqHhkeW4MMQCTySgqyWssZv4NuODSGv8uelwxK1KgSpucDHqTqoZjE4nGDCz1HZlwxLray6w
	OpxOqlo37ffKpWVN5pzu4LVvuR5gDb9oxg9TENwLbbDO+KhgeOfXytqPSMxsnX6uYQBNF32N3Dz
	mEQws1z8qXkEPDPCaLV59sKahM+8jwoCJF5oJZb0bXmfZyrffjX+qXjgkTHvlbWdhSvN+b7kfSb
	sCit8Jcz5Nzt7GeeLJ/Dud5af0mBnpkfhIc45ZT0=
X-Received: by 2002:a05:690c:788:b0:8a8:8456:a970 with SMTP id
 00721157ae682-8b0f21e9dbemr44226057b3.68.1792525224347; Tue, 20 Oct 2026
 12:40:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792345559.git.jan.koester@gmx.net>
In-Reply-To: <cover.1792345559.git.jan.koester@gmx.net>
From: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Wed, 21 Oct 2026 05:40:12 +1000
X-Gm-Features: AclHuK_4nBepdHPIpyzJ4Q-CKoanV6D7TiXN__qc8a6qvpWN2kog280Tj0oflWc
Message-ID: <CAN05THQGpsya=GJgZjwdNpsrDF7FgRw1mTQePnaoRAgFfKVRgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] ksmbd: NTLM pass-through to a domain controller
To: Jan Koester <jan.koester@gmx.net>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Steve French <smfrench@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 03:53, Jan Koester <jan.koester@gmx.net> wrote:
>
> Hi,
>
> a ksmbd server joined to an Active Directory domain can authenticate
> domain users with Kerberos, but not with NTLM: it has no password hash
> for them, so the NTLMv2 response can't be checked locally. Clients that
> fall back to NTLM (access by IP address, machines outside the domain,
> mount.cifs with user name and password) are refused.
>
> Samba solves this by forwarding the response to a domain controller
> over NETLOGON (NetrLogonSamLogonEx on a schannel connection). These two
> patches give ksmbd the kernel half of that, and leave the NETLOGON client
> to user space, like the rest of ksmbd's user handling:
>
> 1/2 adds a KSMBD_USER_FLAG_PASSTHROUGH login flag. For such a user,
>     ksmbd_decode_ntlmssp_auth_blob() doesn't compute the response from a
>     local hash. It sends the server challenge, the user, domain and
>     workstation names and the NT/LM responses to user space in a new
>     KSMBD_EVENT_NTLM_AUTHEN_REQUEST event, then takes the session base
>     key from KSMBD_EVENT_NTLM_AUTHEN_RESPONSE and goes on with the
>     existing key exchange. Both events have a strict netlink policy and
>     are checked in ipc_validate_msg().
>
> 2/2 puts the workgroup, not the netbios name, into MsvAvNbDomainName and
>     MsvAvDnsDomainName of the challenge's target info. A domain
>     controller checks these when it verifies the NTLMv2 response (Samba
>     in NTLMv2_RESPONSE_verify_workstation()), so without this patch
>     every pass-through login fails with NT_STATUS_LOGON_FAILURE. The
>     patch also checks that the challenge blob fits the response buffer,
>     since the workgroup can be longer than the netbios name.
>
> Logins of users without the new flag are checked as before. The only
> change they see is the domain names in the challenge's target info
> (patch 2/2). ksmbd-tools doesn't set the flag yet. The user space side
> we tested with is sharedd/adconnect from FenrirOS: it marks domain users
> without a local hash as pass-through, and it answers the event through
> a NETLOGON schannel client, tested against a Samba 4.22 AD DC.
>
> I can send the matching ksmbd-tools change if the interface looks
> acceptable.

Please see https://github.com/cifsd-team/ksmbd-tools/pull/346
If added it will give you much improved DCE/RPC support instead of the
hand-marshalled
stuff and make it much easier to add additional DCE/RPC functions
you might need for this in ksmbd-tools.

>
> The series is based on v7.3-rc7.
>
> Jan Koester (2):
>   ksmbd: pass through NTLM authentication to a domain controller
>   ksmbd: put the workgroup into the NTLMSSP target info's domain names
>
>  fs/smb/server/auth.c          | 109 +++++++++++++++++++++++++++++++---
>  fs/smb/server/ksmbd_netlink.h |  41 +++++++++++++
>  fs/smb/server/smb2pdu.c       |  21 ++++++-
>  fs/smb/server/transport_ipc.c |  73 ++++++++++++++++++++++-
>  fs/smb/server/transport_ipc.h |   3 +
>  5 files changed, 236 insertions(+), 11 deletions(-)
>
>
> base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
> --
> 2.56.0
>
>
