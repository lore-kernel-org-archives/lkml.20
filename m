Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779A44DD3D4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611034; cv=pass; b=RbInUrKTznfYCaBwXQhtKZUlybFvwzatgTikLJFMMkK9WSWodf2EXRj+WlL3SEkUY7Sih9DCw63Aeh+9S/EuVKmFPSzgFhbXF/AG5qM0m+MVVcNhGtl5xKvy4usj+c8S3RGrq57VXCx/U2HnuZBaHFb21MQzczSEUA+aBiaDdK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611034; c=relaxed/simple;
	bh=QqOHndixwXTfbKcazOrogEdBF1Lh5VPxTHmhor2BS+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aduSy3kiwo7//Ia8m7IiXZ2nCtKHKHTDxv2ITC5AXnJ/VCS8KnmioxAcYo+4gHZP4/OO2g6r/Ilw8sTKeIJ1C9c1ATTX9hRiK76QAPhZa4aVIWZyWJ/XWMUKpd/JvOht9iKjj8hk/lLxTkcD+10gCj1CWK8a6n7j5pqa47VK7ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cWeh1Vaz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FjeO9ox2; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cWeh1Vaz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FjeO9ox2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790611032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/ZTD2VeOCjUPPogrc+Mc/r0VX3g+O7Z3MtGT/sljKA=;
	b=cWeh1Vaz7q3eZnkqonoVOPF1YF/RVgC+7FcGRYlv0t5jT63KddeguL0DBpszp2rEC8iClu
	rmNVnzFy0CC1ytXmXAciWd1tFqtEDklO8kRB1RFiIu9TjSUxxkdwlJ6mzruOUOblqxc54B
	1e4lBux0rga3YEOD59YOegY73vs/mQY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-OvIh6ykOPjakuPAaQKuH5w-1; Mon, 28 Sep 2026 11:57:11 -0400
X-MC-Unique: OvIh6ykOPjakuPAaQKuH5w-1
X-Mimecast-MFC-AGG-ID: OvIh6ykOPjakuPAaQKuH5w_1790611030
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0bcf8b74cso3287465a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790611030; cv=none;
        d=google.com; s=arc-20260327;
        b=IbMrzaoCGbxl/KjqVavVV5JgTdqbspIywHbLzLkAPxdIn/IKG2DvvrdNLpUX7tXuKD
         n+2h3ND3kHBshvIOYDFIBdYWU0ZEAzAW7bnsk8CGYKuB5KtRe4Egcwg2Ksfe54OchVN2
         a2zaRv8EWm6lXmpYXMIDqp47AX1aOs+l/X5HQwZUxfYrvOkwE/jIWr6UVjThTj4CWtX9
         +nZBu8+Oq3OFXorOtms+zAXDFAg6GoEQnHYs3JgieUchlw+SRioMUvMYtPvu/oXBtvZQ
         l3YjS7s+Ijds6oyfTCpaAof9RyGMHK8mLnEvQ1sxe8w0HTl0/hWYJURnjei1E8iXqfk3
         sPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0/ZTD2VeOCjUPPogrc+Mc/r0VX3g+O7Z3MtGT/sljKA=;
        fh=L+3TdEZrD9y6s2Fco5fltuTKfQrBvkMU5ZbmHUvHIfg=;
        b=gGPvf63lvaEO06nTvmNMTtrXX/DoyJ/yz3f/Jcg8+hwe0k4En/p1E/mMLDSUyfpKT9
         X+bHtAZwrzvjX0F2AZJU0wYorlVsIYLOAhmmFFV2DPiu3irx+ZhTsisbz7g4Zo+1/hPC
         qss2rbiNBShjgWjcrowX2BJ/dsyhTKIlsQQjYF0H8aPAyI/VVIAYaI+1rmk+icAlcqFR
         lJCPaL6bVwCSZjRrRacXvXVFunkxWETA/XHN2yeaVhK+umG5MHjTgDpBMp9fY8E3tddc
         Ul5WU7IPb5+VOBiCrZcBu8G0ty2E0sQ0THhyN4/DBPgdDa9lhEnkyrRTZ3jCHOCncnzC
         RQVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790611030; x=1791215830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/ZTD2VeOCjUPPogrc+Mc/r0VX3g+O7Z3MtGT/sljKA=;
        b=FjeO9ox2H1n5hhCeNlVaE7A6A4aSQ85LY6/jLva50w4642KxT/NkxrW3UJAAkfvLbg
         LeqEhL2ufzQEWsjjXU/yhwK5aDM3ksxtc7NUSqZHSr1f17Yaj7GIMaAVeOkQqx8N5033
         O5NTUPr8/s1rwFn3TylEea9OQn5X1JdRxp4ConZ3RpJZo7T0o4iIY1Ujy09OZTXfdIkt
         a8K8zAm9ZUbe73YxHZJVptqxAkanhx56RVwRXa/KUj44h/ij5/ZjSpGgBpQOO0udHuXY
         LzD3TK1G7LpV3zEC3rQ2bAcMqVMt1diI2k0ycyolAvTVNMAVCeTAFU1LHLepzzentOnY
         crCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611030; x=1791215830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/ZTD2VeOCjUPPogrc+Mc/r0VX3g+O7Z3MtGT/sljKA=;
        b=OyUsGX1/BEXTf0yCnRrE2lRebQFlBjlOTD9p4SPaDwy6n5h0nv+vyDxnIISeGBgbFu
         9y+tgX2XWPGtvDzvsoYfHPOnSYhejzW57SOzOja/1aS6Ex9V8jBcGvAjad0prl24XvEh
         GFdjqw+gNId1UoxFSBfQY8WNaskiO5xonEDj+Ba3ehjn7bYncAFY33wqOA+1pUDTWZwf
         75aQWdxBYxLMHBgzD0Moihb9L4vRCfy2o/PeJ8OTjFQfZbSDXRYQ+GKMdufyY3DamioY
         sObgCtTyaIA7YD8mncg5PufnP3QTy7kg77AzEyuzHNXENBuJqahyl4NYDQX8woqHO57U
         oC/w==
X-Forwarded-Encrypted: i=1; AKwUvByyi+HCGulk9U/lsM+yup8NNjGu1OEMnP0DVx1rfMuDgdCx7kkN4Bh46rjUMLJzkiqr1QjnYf/gUUJWUCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDISS3zsO9z9K/a680VqIwg8MkGfXZd6kVzPqRrhtpDwd8uuhE
	XbvvnG2ferr1NreJhzc4pVAmCdg9Qu6SxOVKVkf9/qNkX8qrWxuhPrqF9VHqbROTHwb2np8PptC
	lOLItW9/tMZnR48ajFkitczd78ILZfg4TRj7UGKmLwMRmVeKRXfN8r6NK28mzK/hbWWukEH4vOE
	Zj1W1XivNMjSB/shSu4oypwhU3botOd2RLAEgbu37WRWQafWhR
X-Gm-Gg: AYBFou0FoSiif58hqXYl/JO2Rc5j92x1oY3oWp+obI/gzaCK/0xLD5qtg7xkpql+n2m
	jFcCAFXLOauhYYfZDkpdZpIkKWYWXe58UuQvor5oM+6Px15f39vr8na4l+s/PMJSnYR5Bl0iZU+
	+xqF7mLtKArTORxdF4myH87ygRuyLqyb26TvOZ9sXVbTtGbN7fl1/RrVQAk2ElJXS4A1yRfPpR+
	Tjk8Z4r29xOnl462BFT+cukkk4sZbcc4yLZu6A4vHQWH5Xss0nAm1gpw0VUaA==
X-Received: by 2002:a17:90b:2e50:b0:39e:6a81:5a97 with SMTP id 98e67ed59e1d1-3a098e3e987mr11638009a91.43.1790611029676;
        Mon, 28 Sep 2026 08:57:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2e50:b0:39e:6a81:5a97 with SMTP id
 98e67ed59e1d1-3a098e3e987mr11637997a91.43.1790611029099; Mon, 28 Sep 2026
 08:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925233321.2381319-1-seanjc@google.com> <CABgObfZeA_q_prxJhbdNqYpE8quPD360LhVBQv8ypcPpLA-Mhg@mail.gmail.com>
 <arqKrvYupBpAM2WI@google.com>
In-Reply-To: <arqKrvYupBpAM2WI@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Sep 2026 17:56:55 +0200
X-Gm-Features: AclHuK-7CM2Is7844IC-ONgeUbRSTmzwlEMShQq7MFNhnttTE_XpGhhHS1k5ziQ
Message-ID: <CABgObfYBt61rn2RjSP2DQqNUN-eBK6NToW34va+1x=K-sQD4VA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: Fixes for 7.3-rcN
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:41=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> > Pulled, thanks. I added on top the SEV cache writeback patches which
> > are not present here.
>
> Heh, because they're buggy.  Sashiko pointed out flaws in both[1][2].

Ouch... I have just now noticed that Sashiko only replies to kvm@ and
not reply-to-all (including LKML), so depending on which duplicate an
email search took me to, I was or was not seeing its replies. Of
course for my patches I was specifically looking for those replies and
therefore not seeing the issue. Fixed now. :(

Paolo

