Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0533F4DE6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518040; cv=pass; b=K0YAfOBwZ4xUmP+3I5pW+j+ZY/z1AWcVjpjVhev/wILN5/LvDxqzv65TGY3Yq+jTL50yp1At4GpY1moMuR0lLs0wZXB9MUomIl5M2Tv/Jyn8fbA8L2XYkaUCpu24zK2bUMX16yY9k48mZso/tlgywzoVFtjVjflMvezM+AmxR0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518040; c=relaxed/simple;
	bh=btEpaMCWQy8KnG/IttUdumOkddYQrL9haIDMPMMmywE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcKzNmgtPxS6XuCEL5WqnEcYnUn+lFDtJS3BZilTsjS3PgObVXKTugqp8q8pVyiqNzrZdh1u4CfAoEFSTjvbfYRMYVRuoTu0YEAcQ17YpSa+m9oVQIjv4FxOwG3zaVgjYvIOKmIc0quVcjy9+ml/G7GkISR9yx2IrekDdWzWZzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2/afTA9; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2/afTA9"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa449a74fdso173267a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790518037; cv=none;
        d=google.com; s=arc-20260327;
        b=nxFk/24M1N/hJESxSPUfEk2Rd4YqkrVRFvV/tNpFF3yswW6zHnnAXEkUMY+yhmkdG6
         4Mi0faKyG0X81HaRsmpxQKF21u3H/ac5WriucxFMqMVoEFWuHrplUFHUqehn8MgKRW87
         057FtGOFXqmd3YR1fw+wpZ67jeGWwz6mwoBhtv3SD52WG64i06e/R/qmq2bR/cTTdHJs
         4QFU8cTXmwr7EqZzqBeFkFlYUDjZvVgIP7hVC+V0MY0GEPZpbAPbyXhDQIotBq5tniiM
         iX02wFjaXdrrSGbaf4sKT9wmadmC/7GHZn9ixUhdc0FAHGP6bKM9gXPvr7PIW7+Y8xx+
         bLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btEpaMCWQy8KnG/IttUdumOkddYQrL9haIDMPMMmywE=;
        fh=XNlDV0Vju9nJZZR4xRwAGQn5W3/VLLco7b3SuEqXV/c=;
        b=i0E+7IaiHg3Herx6cn5NcorJ89h/6iNlGOpFkWaHKBCRMuCvzW6C/2kPtJyg4QO/hT
         X2iCh7bkbc9MVPcDhg4qzPu4bXKMXeAl7OXnUc0fyieSJNqMTIaGwYWIlCFcDwKkdPGF
         N6WilJ5/fwzfBtDoPXoEobsLV5iVzcpWffo0ItnkLq61qhkBhJY7eY5IFe1qvn9Z5Iuq
         IKPpUhO1Tq7VDFe688RrJSEwmyeFVqL3CMbX9XnL90wSwzBLFXKlZcYiqqWFotvybDtS
         VjfIKIlJk65WAB+ZSIKE3A5iwSnIK4+E3Nsm8fM5S7/ptuH/x/qrKeBrtcs5tV3lVGYn
         xHxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790518037; x=1791122837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btEpaMCWQy8KnG/IttUdumOkddYQrL9haIDMPMMmywE=;
        b=D2/afTA95f49OOCyaY24lT6thKIDGHDkLBMgZQvck3aJCGot2AqAXoM1nhnk19G5gK
         KtLkUxxG8ih38iigoWjqsczVtbRF+TuYUsBaLZ3jdAL7aqfjN7PtXLH30dgv0XpKmSUK
         Hda/CaSh1Hyl3CXdyM3gFoo3RPm5G4eHWvY2uXyBlLHCNsOzLyo5xVD9U2F+hZQGp8dR
         6YHzU7hmXBZo0N30+wm7Jp3T2wuNiz/Rt4N0UKlYVHtKD5AddPgHBkHYy3AwCTYl9K8N
         wos/DNPWfk3sxomp1UYkQQOpl7fkk6oB/E+/hYfK55lBMwaDwvraMtSVMhpAsezcZHJa
         ucvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518037; x=1791122837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btEpaMCWQy8KnG/IttUdumOkddYQrL9haIDMPMMmywE=;
        b=tIsyoYdE/0XCDPydgBAZHdImz5djsp7Kg4fXTvRaeDNkTq9XW7xN1XhIkWQHlADBy7
         RdbAGh6jQpQm5mCzuioMEbWr4JLuSPf869OauzDSk/NKFjLxPiD+xzTk93M+V9xf7jJV
         DyhP7TosnUmFCRZoknCNXtTZmzPemEXFBB+hbI3RnLE4Le+tVuFN3Un5S1bnG0VFLaFF
         yh+QoMMxbPq4vOUmfBRyE2sNSfDRF39hAAD+11EA2tLOqOAgXgD7/BUazYRa1jjIm/z4
         Zg0vYC+TpGMcjMxWQLg5dNFQkChktKnSCbTn5CcFUyqUb/s8vjHc7p/G55+b8pC3tVIb
         TbJg==
X-Forwarded-Encrypted: i=1; AKwUvBycJEJLMm1d9JsW5pN5XIUi+1bbW4Ltvn6N0eCPEtjSXn+7JyD0cgksarl1IFw5aH/LRJSeEhCbxiSA3Bw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiePg1Ex3d8Jg7+xkdY51MHASjsqy9YYnh+5wFBkY22gA4pubd
	13S/DLZMj/Xp9+YB2uWfGBMBVzdaJsRZNKWlBzaKmdW83c2ScV+LlQRoS/lCeTvTdOUK3v0UkfA
	vyYwCzMa7W1tVFXknp/hqb5+WJZ9n7rE=
X-Gm-Gg: AYBFou0RBHUvqkSw6ai2eVkbifppxgdQHEGJm9Y/EO51U3jtb9aPT5GfAK2OYG9v3UQ
	jRx2Nbpq7/Dxu6Ds6WZfMhCl5f2YJn+IhpTOCfMLSoHLCffXQ3cFl9UM+tVoBFBravXxzpQEY6a
	Q9gK3+eNNPKRMxyjUGhoeWfBg4sEdTM+XpReEVf884Pbqi/C2JB/XD5+23Q0DAyxSYAtgir4Wr/
	cyClOtda3yLfLLnYot+bWZgVelq+M+H90GIIEguIP8D3rRHfVKc9fCQv/vEqgLvnllJ/ANHEcWy
	Q2Y5CQI5xcTRjRHHF+tqFIyhC4LSsk8tMzpEPY5ThgpubkmkuS0PpNGo4gJOp2DsFyQh0+G5+FA
	diqQZW3Glawltf1i/oy9Gwg==
X-Received: by 2002:a05:6402:84c:b0:6aa:a78a:6a05 with SMTP id
 4fb4d7f45d1cf-6aae1a75d8amr6926922a12.0.1790518036568; Sun, 27 Sep 2026
 07:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824152331.216494-1-nicoyip.dev@gmail.com>
 <20260825185313.239861-1-nicoyip.dev@gmail.com> <9397cfcc-03ee-4269-a9f9-97df1f454ebd@redhat.com>
In-Reply-To: <9397cfcc-03ee-4269-a9f9-97df1f454ebd@redhat.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 22:07:04 +0800
X-Gm-Features: AclHuK_dPBEhsvAmrIGJX0etkLRLKkfvqri0XmzuWMrBwb5evay-fQetwCixOjs
Message-ID: <CAAo+4rU1LSjpaPmXzSrM9AYDhaPksPLq_Z27XzTNx_07HYBjgw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: pktgen: return bool from __pktgen_NN_threads()
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:16=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/25/26 8:53 PM, Chengfeng Ye wrote:
> > Callers of __pktgen_NN_threads() only check whether a pktgen_dev was
> > found. After the RCU lookup they never dereference the returned
> > pointer, so returning it past rcu_read_unlock() is confusing.
> >
> > Return bool instead and keep the pktgen_dev pointer local to the
> > RCU critical section.
> >
> > Suggested-by: Paolo Abeni <pabeni@redhat.com>
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> ## Form letter - net-next-closed
>
> net-next pull request for v7.3 has already been merged, and therefore
> the net-next tree is closed for new drivers, features, code refactoring
> and optimizations. We are currently accepting bug fixes only.
>
> Please repost when net-next reopens after Aug 31st.
>
> RFC patches sent for review only are obviously welcome at any time.
>
> See:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#devel=
opment-cycle
> --
> pw-bot: defer
> pv-bot: closed
>

Hi Paolo,

Sorry for the late reply. I have reposted the boolean-return cleanup
as v2, rebased directly onto net-next.
https://lore.kernel.org/r/20260927135406.3969970-1-nicoyip.dev@gmail.com/

The original UAF fix still applies cleanly to net and has Eric=E2=80=99s
Reviewed-by. Could it be picked up from the existing submission, or
would you prefer a resend?
https://lore.kernel.org/r/20260824152331.216494-1-nicoyip.dev@gmail.com/

Best regards,
Chengfeng
