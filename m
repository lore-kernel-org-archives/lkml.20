Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA44FDE71
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458658; cv=pass; b=ZQUxyDMCprpvnK0tw3TKHyQe9pm/b3ziqhRD7qpKBl0cDgLvZfeXz3395JIEfn2LKyLrVb6Bs0EaJUP5nQ+kExRI9EPtdThNgRI4x4823VHXXrOyKDKfRto1BdzG1oiEULmfUOeyyIYNTMu6pb+WF3BOHroyqjN6z+RwDNWcgJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458658; c=relaxed/simple;
	bh=rBhnMpnlpQJIqe45e7mghY2bbrkfay04f++iDuWUl10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKb4sw+POCczw1MJqc3JMgKE7B2fhAQCqvyEi0+McPW1ypYdV/llKUZLkQhnjr2InrkLwGSQv8zAR9tDbjIifI5LmR7IYPu0KVrgDwDaz0wkoXOHnivjsYvLDXVRXI9yw8D4Wiqv5r2ar70gu5CdQvBnJolu38VxqlnMfjvJCQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RccCEGpi; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RccCEGpi"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a615ab11b5so7351a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788458655; cv=none;
        d=google.com; s=arc-20260327;
        b=kbcCdL8HFbsZ3+kOC/1CTWfgSFy35uQtmYyp2J891Bw+Dh9O3tEfVuiCHxuDGmPwpV
         GIvA3K92NsKb5Y2zQaVhB8lcSprqiyo3w0NxGQ+Lor31aW4IQrZb/Z3nDoIczbxlLhJe
         uDlWOd+CYKHJRPJ56SegV11W32J3kT6kNBhbkEXy9+xN/ofM3YkH2wSvLcTkBdz0QIgz
         omZUzHBsehDch9FeSFIWC/mQwZwmDAJMcNR44TFU3bA3856gp63tfjqa6iIHd67lZYm7
         GhKur+PBjegNHcuwqsTn6Duxg57vmELAbqbaH4mppI+jEQoqV1usQkwrO8Y4TTMb0Mv4
         U02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uK/GuQ6nbungHJUUyJOtLDjrs+AVjPNapJ1G3ZSkOBc=;
        fh=uSzt3jgl5ZmGf+XYZgZmEpYnk79Vm6KqkOK2w3otVmk=;
        b=n09x4ZrttL8d1IFpDt8Jp9lGNDrxrMQizNxGi9W0uOOdsvyqZUgweVbBW5xPWTqso6
         BYTB83UwJxcT3oc/0Jkf0YO26gFdnWjI8oh7E7Kj6F4gO1sBo3Z1ox9MdsJkwQSx/0Iw
         24mHN/VU9hTfp6LyCMnQtyiyrcmccmeR9R+ClJk8peYPM8avIJR2OMTAHNInGlS3Fl0d
         4XslaqRJ86lSP+xL/icit/7F9l2tXuQvYv3KDkVscLkDV7/QswfBWfkMZk1vOcYWLx3l
         pulIHY+aEq9ZpJriELMZaC8jlLFB6b1Pz+NY7Le+2BvD2lwYqeNBqv8Ueqqz+FcaY4us
         jbBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788458655; x=1789063455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uK/GuQ6nbungHJUUyJOtLDjrs+AVjPNapJ1G3ZSkOBc=;
        b=RccCEGpiA7D7Pf/qAQaHVXLmcQu4HvtTYkDZDCl9EtQa8UOUSWjX7VNEbGAToiTY3+
         1K8kZCa/pTbhlPrZlOZIXKz0XXv9xDSv+qWrTBbcyWDD7iZvT/xdng91f/FAYq5JEuw4
         vs5PeWxL1VX6hcuU3w54d3Gi/USbAs7D3k9Qurdvj0zwujivEJ2rzi/2HEPEMjbwruub
         7ePUCfV84U4s+4+TjRX2UyaBJh8XJexp2mioen6Q5yE8ezRjYCf7jiPHi314mMQHGWQD
         lHA32d/k/KNYFlTGdCD4R3OzjfDGuCT39rErJLZaMgRnJihS8DYZlSg0Wgd80oryWxlK
         BAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458655; x=1789063455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uK/GuQ6nbungHJUUyJOtLDjrs+AVjPNapJ1G3ZSkOBc=;
        b=sD7UKs2nHwC6cTvD3D+TQKVWwIOCldWOCJBUItxS7ISbPALe3ZKTsunCP/ghhRrQk3
         ynl2UriWVQC+XBgoSBfEEkLcUOoTxOHeuyP20NmioS7KZaG7U6FT//0ttCB4vEexYpJx
         Vjs2+/tTJAH58D/xphkst22NaVa8sgBLwH1tldb4vXjYYgCsEO5+tZJ5IPXSwcwZBcji
         yZN0AfoQivoxnEbFB4qB7Efie3AG2jDqwdZcyNUM1KVQwOst+DawvP4F6Ggq5sqlF9CY
         RH6bSL9KuvTT2uTMnIdDPJ+Gb5w3abFIn1S8z2/ILUhNvMavv05yqNi0Ryig0lW1mN4Q
         IM1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6hc6hVO4HRMhRuz6U72ilPRIYHzrmOYWy4FIHQaLzL/8h3E5cleolS4+pFdsUYqrQtZqlt2fad4gNBHE=@vger.kernel.org
X-Gm-Message-State: AFuF++kqWBtKrbCeAjZt7P7E6nA3O+O8RMOcBcstNTxG1hnGLjSRtvzI
	srkoDiAibxdVa1pj3AZUQ6UTA1t/MAoBMVqu6hbLtS7bEmUPuQI18nq/HCP9Bx0ttS58wmcVwPW
	aAZOar5RgPe0v+NkF9PXHKYqz7msF0XQ=
X-Gm-Gg: AYBFou0HPZePRrtns18fRzociK77Cpuw3aHRZI9EsqPivNgr9twdH6/2XOw3FtjDUv9
	lYMkGcgGyNYRShJ30J6HkBbmnopHfPy5Yyk+GvPhbNWf2E5PE6RGnPTMe83Omh35FA1njxTYNnc
	eMG7dHOBbK5IbjfSLkbKbObWhoUWWnyNlXNJre/FJmlBqd3+HhYD7J5/DD6o/Si83wDu4LGkGdD
	1Lq/ZKTnO+RH1eQwoveP3rW+lO/w7J7y77mfLbBlRzAKk4lZ5qTX3cNR27+fvIfAKNgVCDLmKV4
	PSyRX0DU+prrmU3PZOIJWLB9lr0LfScDQ8Tqx/3nqg6oo0YatFUY85L6WIxYmEGpub4qpGtqAQc
	=
X-Received: by 2002:a05:6402:440b:b0:6a1:d68:338a with SMTP id
 4fb4d7f45d1cf-6a6818d6c95mr5674598a12.0.1788458654598; Thu, 03 Sep 2026
 11:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823152858.3839939-1-nicoyip.dev@gmail.com> <apC0xGqWTIXTIgBU@kernel.org>
In-Reply-To: <apC0xGqWTIXTIgBU@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Fri, 4 Sep 2026 02:04:02 +0800
X-Gm-Features: AcwNN1Vixc56lPwOlEAr0jNOgKZcPkT3QtgHqPSwQ2VM7-p1rr5p9dczVDYtyP8
Message-ID: <CAAo+4rXK_MpdsSbmuu+oHP2STUxApG2XRBkKUcpvcTKETEznOQ@mail.gmail.com>
Subject: Re: [PATCH] keys: Fix key_user use-after-free during ownership changes
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Serge Hallyn <sergeh@kernel.org>, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:06=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> I hope you don't mind that I sanity check a bit:
>
> =EE=9A=91 git grep "user->uid" security/keys
> security/keys/internal.h:       uid =3D key->user->uid;
> security/keys/key.c:            if (uid_lt(uid, user->uid))
> security/keys/key.c:            else if (uid_gt(uid, user->uid))
> security/keys/key.c:            unsigned maxbytes =3D uid_eq(key->user->u=
id, GLOBAL_ROOT_UID) ?
> security/keys/proc.c:           if (kuid_has_mapping(user_ns, user->uid))
> security/keys/proc.c:   unsigned maxkeys =3D uid_eq(user->uid, GLOBAL_ROO=
T_UID) ?
> security/keys/proc.c:   unsigned maxbytes =3D uid_eq(user->uid, GLOBAL_RO=
OT_UID) ?
> security/keys/proc.c:              from_kuid_munged(seq_user_ns(m), user-=
>uid),
> security/keys/process_keys.c:   uid_t uid =3D from_kuid(user_ns, cred->us=
er->uid);
> security/keys/process_keys.c:           uid_keyring =3D keyring_alloc(buf=
, cred->user->uid, INVALID_GID,
> security/keys/process_keys.c:           session_keyring =3D keyring_alloc=
(buf, cred->user->uid, INVALID_GID,
> security/keys/process_keys.c:                                            =
   cred->user->uid));
>
> Have you audited these and reflected against your current patch?
>
> BR, Jarkko
>

Right, there are more sites that take and dereference key->user but
not serialized to prevent the UAF. I am going to send a v2 to protect
other sites affected by the data race.

Best regards,
Chengfeng
