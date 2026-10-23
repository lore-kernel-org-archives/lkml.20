Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739858;
	b=pQId+IMWuvI/giw801K9lQFGzK6eeOmxoPYIIu0aY9SR+UMBZi0K8CekZBKjE3eKtbyx
	 LLulyMXskNLNbbOLJG2ZWBDoOJV/zrWBUIWUskObO90WeZoVw5u40Ddp8r+C2lvqWqvYG
	 9SPH1ciHwHErMsJnNpH10olEAfbpQlBDtpQ+dx/ByCgoPaWArw58tDNXbPVeD0rhlFThe
	 zJPvogzB4P0PwpID8WhhOdM5KPluq+zt1dvdlX+7sF0ZQbys9FlXNeTUCKmzjeE0iW9JM
	 mI3/C+z0YY8/ko43LAIYwRZisli/gLrC2Tmd+YoJ7ikhiB5TH73rpiXwb3kSBFignWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=oFecwN3RYDD4yV0jcK6iKdh1p+H+i4Dh/TZHPXt8v94=;
	b=cTjbzJoUAnUkXcVglO7aruUVwoZwvCURJq/I5Udu3kHosnkvDTaMAwlQXTSHWIeHafi1
	 R5ZSpb0atQci2DwSWq+baoJj37elpiwLYjcEMr6ArsHcpXFiuGYYCOJiEOiYGB/0LCmCt
	 S08cZy9GoNKK2PBLkzlNIhQbYDj0BPNMh98kfjLODbK6fchSiH/uYILBXx2ozy3pATffg
	 6Gz8lTI01VyrL0CxGZAsyGi8TnYkFAeJLoGfZ9kN9nZ7MV9fRZrNFVenS/nearHE3hXrY
	 VqIZuql6oRi90wmDqvfK2muOkPbcyeMUuhNFux/fknyek9GpjyrkoS3wLYJb9dptUEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K0GZfDjj;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A621606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A621606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=K0GZfDjj
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so2177045e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792739856; x=1793344656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFecwN3RYDD4yV0jcK6iKdh1p+H+i4Dh/TZHPXt8v94=;
        b=K0GZfDjjev+MRYwCLjtTqqo10IhI376lT4ECs5nRFEnQMGAyAvyP7qqt8Gtef837Pj
         bTOspWP+ml/IUdbK4C9YGGzJty97pw9pDnr7U22/m39tsXwmXfMjaBE8VgDqh9qnkFcC
         SHiHbnskVXSePsxzuxHVycriMTZn2sbHODY3HhhYpRt9aFGbNlt7bafHx0MMGpygCLtp
         oBYDEqebBwaxEorehdDsRrkN+F/7wB2+q5nkIQ144cdnE+Gc+jDf1uGubxUczIjlKkki
         HdYCu72wqq2oy2rXKZoEYcCYsAmoB01HO/eSVNaZMthIVKClxnWY6HlUSuf+2BgsRcfi
         QZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739856; x=1793344656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oFecwN3RYDD4yV0jcK6iKdh1p+H+i4Dh/TZHPXt8v94=;
        b=FL/DOvq7g4dpbCJvXVXxGW3tdUEquZpZSRj7Pcz0c68ajTJdRZkYNHHU5GjzA+tSIR
         bPlT13dGnPvHiuJ/hrI/sdzfclESKGSMecGl8tJwQw7xJ0ZjQazQTgfdKcosqIWRbqHJ
         21nPGc9X8enrscvSNGvbj5GUyuF9RIeuDhtsV1thJbP0GQpbqnSB7Pt61DoinWM14Ay+
         1i/1dmjd60GLeL0Nsil48U5gUl4c3urIir7LOYgHfMl4uSI58W2C16e3yt0VBvEOjpZi
         Cc0fmZ8NH0eqwq2vNqNxTkENBrQJ/0uLOsNKUzPtb5+2o7gw1iVaLqagGLMeUYc+0+Jx
         QPJg==
X-Forwarded-Encrypted: i=1; AKwUvBzoKg04d/IPlnn99GNxEyoHEk6uDx5/AQvheMVB8aLtFu1mZlwzhVr3ZkshdagVuq4RT5Orv+3XBhFSMDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH63ynQKKOOcTt4TQC3nFdWlh8RsvAf1DcF7Pa6cdTmS/QpYP9
	1kFzrRi7+OOX48JtrsnkGUiTPoi2THemFBW1umrGc2/Q1f3/0DyLSuTBTJrLy25GNL0=
X-Gm-Gg: AYBFou3m/rteWukV1UyPhp/4NTZSYSt65RGMCaA/+P9iqi554wLkJMBPFLfvG+pB9G5
	0u6m9Gb5f9HRjnL8qESmi3M8qJc7zsdtXgStl18NEu7kQfS2NA0zlYkzjKOeaUA9Ha0+yx7cq6v
	B/xJmzpVEbo8WbndXvi1glK7ium/AfVgjsGyeiPQrEnOnDgQRJo7R5FAyUXjiUmMSniAXFKon08
	/GTRBT+5KW8cn096nILwOZ4+hzeGGU3SdNQcU5OiHPpY2VtppejnKhImcp4Fd56hkVF1tHEjsGo
	L7ity2xW7Ntquz6GN8IvPmrbw8GDeGbfp8FNGz1dYm0NaovaqUhKvik1Klg2OtnW4i35YAEdy2s
	iUPb7lLwL9kVzkDnONmXClwdRhTfNn9mTnX+yalROp9MS03cLzAl1fJsUJ6A3E1tDf2c57ZHET4
	h8fPeMrB3DUhiBoKvCrp1a3BfjCxeFI/ZYtRqHYLvgypM03z0cjzw0oWtvQs/fDPqxH+DmtL9DW
	iR3zWma2JQUCDCcyptqxIkdOcBdgJeFrU6nsxBK4vVrbBrqJJlfBiXyq+0hBWt67g==
X-Received: by 2002:a05:600c:a00c:b0:4a2:397:73f2 with SMTP id 5b1f17b1804b1-4a211cd477cmr20493595e9.17.1792739855542;
        Fri, 23 Oct 2026 00:17:35 -0700 (PDT)
Received: from linux-691t ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eeb9sm6750895ad.4.2026.10.23.00.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:17:34 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:17:24 +0800
From: joeyli <jlee@suse.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Chun-Yi Lee <joeyli.kernel@gmail.com>, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, jlee@suse.com
Subject: Re: [PATCH] Bluetooth: SMP: Fail if the X coordinate of remote and
 local public keys are identical
Message-ID: <atsKBPdEtsxMFP6r@linux-691t>
References: <20261021093522.3536051-1-jlee@suse.com>
 <CABBYNZ+7ro4EHt8DXL-Oo_tgN1bn5av_KkGtaXXU7YqoQ0vDxQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABBYNZ+7ro4EHt8DXL-Oo_tgN1bn5av_KkGtaXXU7YqoQ0vDxQ@mail.gmail.com>

Hi Luiz, 

Thanks for your review!

On Wed, Oct 21, 2026 at 10:00:41AM -0400, Luiz Augusto von Dentz wrote:
> Hi Chun-Yi,
> 
> On Wed, Oct 21, 2026 at 5:35 AM Chun-Yi Lee <joeyli.kernel@gmail.com> wrote:
> >
> > The 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys
> > are identical") patch be introduced since v5.13. Looks this patch can
> > handle the CVE-2021-37577 issue. However, it only checks if the full
> > 64-byte public key (X and Y coordinates) is identical, which is
> > insufficient.
> >
> > In CVE-2021-37577:
> > Bluetooth LE and BR/EDR Secure Connections pairing and Secure Simple
> > Pairing using the Passkey entry protocol in Bluetooth Core
> > Specifications 2.1 through 5.3 may permit an unauthenticated
> > man-in-the-middle attacker to identify the Passkey used during pairing
> > by reflection of a crafted public key with the same X coordinate as the
> > offered public key and by reflection of the authentication evidence of
> > the initiating device, potentially permitting this attacker to complete
> > authenticated pairing with the responding device using the correct
> > Passkey for the pairing session. This is a related issue to
> > CVE-2020-26558.
> >
> > And base on spec, the remote and local public key should not have
> > the same X coordinate:
> >
> > Bluetooth Core Specification Version: v5.4
> > (7.1 PHASE 1: PUBLIC KEY EXCHANGE)
> > "If the two public keys have the same X coordinate and neither is the
> > debug key (see [Vol 4] Part E, Section 7.6.4), each device should fail
> > the pairing process."
> >
> > Bluetooth Core Specification Version: v6.0
> > (7.1 Phase 1: Public key exchange)
> > "If the two public keys have the same X coordinate and neither is the
> > debug key (see [Vol 4] Part E, Section 7.6.4), each device shall fail
> > the pairing process."
> >
> > Update the check in smp_cmd_public_key() to only compare the 32-byte X
> > coordinate of the public keys, making the validation strictly compliant
> > with the specification and effectively mitigating CVE-2021-37577.
> >
> > Fixes: 6d19628f539f ("Bluetooth: SMP: Fail if remote and local public keys are identical")
> > Link: https://nvd.nist.gov/vuln/detail/cve-2021-37577
> > Signed-off-by: Chun-Yi Lee <jlee@suse.com>
> > ---
> >  net/bluetooth/smp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> > index 2df303f6a38f..80128b31e631 100644
> > --- a/net/bluetooth/smp.c
> > +++ b/net/bluetooth/smp.c
> > @@ -2734,7 +2734,7 @@ static int smp_cmd_public_key(struct l2cap_conn *conn, struct sk_buff *skb)
> >          * not in use.
> >          */
> >         if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
> > -           !crypto_memneq(key, smp->local_pk, 64)) {
> > +           !crypto_memneq(key, smp->local_pk, 32)) {
> >                 bt_dev_err(hdev, "Remote and local public keys are identical");
> >                 return SMP_DHKEY_CHECK_FAILED;
> >         }
> > --
> > 2.51.0
> 
> Sashiko is flagging a problem:
> 
> https://sashiko.dev/#/patchset/20261021093522.3536051-1-jlee%40suse.com

Thanks for your reminder! I will fix it.

> 
> That said I do wonder if the check is only truly valid as an
> initiator, since as a responder, this could be checked before
> responding in the unlikely event that the X coordinate happens to be
> the exact same as the initiator's (if that is even possible).
>

Honestly I'm not familiar with Bluetooth. How about the following change?
It also checks local pk before Responsor sends public key to
Initiator:

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 80128b31e631..d1786e398128 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -1889,6 +1889,16 @@ static u8 sc_send_public_key(struct smp_chan *smp)
        }
 
 done:
+       /* Check if remote and local public keys are the same and debug key is
+        * not in use.
+        */
+       if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
+           !test_bit(SMP_FLAG_INITIATOR, &smp->flags) &&
+           !crypto_memneq(smp->remote_pk, smp->local_pk, 32)) {
+               bt_dev_err(hdev, "Remote and local public keys are identical");
+               return SMP_DHKEY_CHECK_FAILED;
+       }
+
        SMP_DBG("Local Public Key X: %32phN", smp->local_pk);
        SMP_DBG("Local Public Key Y: %32phN", smp->local_pk + 32);
 
@@ -2734,6 +2744,7 @@ static int smp_cmd_public_key(struct l2cap_conn *conn, struct sk_buff *skb)
         * not in use.
         */
        if (!test_bit(SMP_FLAG_DEBUG_KEY, &smp->flags) &&
+           test_bit(SMP_FLAG_INITIATOR, &smp->flags) &&
            !crypto_memneq(key, smp->local_pk, 32)) {
                bt_dev_err(hdev, "Remote and local public keys are identical");
                return SMP_DHKEY_CHECK_FAILED;

Thanks a lot! 
Joey Lee
