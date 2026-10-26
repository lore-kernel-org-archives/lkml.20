Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024843;
	b=Y1gaKnOtruulH3UXDOwkdKP6zaQnREHGNpyn4cHdfom9zmm1k0d+b2quB/YJzx2GupHp
	 u3XT9WrXFEwNevgWN/nZk45KwsHheQKNCt1gXQZ9Ws4l1CGUDcjJZFkcp1i6pmiJmc7AO
	 YV9SJB5bDuTuAAMDMQMXcRG7RzqZPikvacrZKuVTqzzvsaqI8Rb3azouasqCk3peLVSWZ
	 fa8kJUBkrxDuuSdpRrfs9UROaLgylw/IURdRx2vd+Uv9ww6Mr+/Rl00ws+VHViRW5STWn
	 SP575YjDaP+rLEjy6syA7qtVunzQVHl+vPjcoBFucRrgShW19Oyx2YlsLq0FUVRCytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pWNIDudccydM955IzkAINXE2ZjY/ipVqw0niCy80XBs=;
	b=OR7/vIBweaDf6h/6WZtOVlkIM1hRZt5oIhfFi1QPSD6isJO6syUyKPF1VuLAYoK+IDz3
	 03Z8anWl3unbB46QeutpKLU8CRGWQoXZAzxdgjiv4G5S1BMIxZj9Qr6rJcucWCJaPdNew
	 gBwdL9evVBZJvNS/S8ZLWPqyy5KLsoidQBgyqM2z+ln3787fNddFcr1mq77PRq6XvCepD
	 3MN1KggYu1GLsEL9WmFhN+cwfDxjbipmPZvuEB0Xbt8PSP5Ks1mrqsCYEI2F/2wzh9Iig
	 TwhagKJTi6SFx091ZQefKOEU8T9iJRa2dV2jIE44CsV+XklSlHoaxsWXRoCxKqNJPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XhlxvgU1;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09E4606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09E4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XhlxvgU1
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso13749775ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793024842; x=1793629642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWNIDudccydM955IzkAINXE2ZjY/ipVqw0niCy80XBs=;
        b=XhlxvgU1GrMaPNJspEjfRmGarJy5LJYRRhTg1Hq/82/Zw43IZLmp1XR/SVpCsCs05U
         BoGs9OSrt8nbSJESb3b6dLlIhykpaBy28HH8+8wK9xG+vb2OSN/fiGslwFxR/GKZEZ8z
         m19YStf2V0YttCwB+h1Ew2WhtANJutgxfoX0HLvXOn6juDf2bZROzyGtjQ4vvRzF+7XO
         pm4XP+AZgP36L+2ig5rDwJ0P1QJdE8Q0aVP36TEb1uirPl3ZKJ1WrDZOhzgckhWRNmIn
         GkkvbnCuyiz50A6qCwqJCiz9XxLWrqnGx7fqHQfrfdSw5/PXSL0VMpNbQxZQedFvav1G
         +gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024842; x=1793629642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWNIDudccydM955IzkAINXE2ZjY/ipVqw0niCy80XBs=;
        b=I5HrZgBhRkHVxiFowOPWR6zNUSmHhH7Hri21PcLI55oicbagCQevz6Tk0KE5cm45Qa
         rz7mrax4/AQ1CDqZGa6wvHbbURS6KXzx328njrbYuXTUfYI1zioLAYgNd3dYX9qjFJQF
         LnL6YCuPU2VF3CKg+HMUJpX1LScfTm4OdXbZTkuLHAhGS4Uw2hIf8gPwj2yeo6SsH3lo
         n2ezlyR4WewyA60wFNhwLQVXCSbr/BH7l9ZH2JGTxQaM1IWzXr8aX1q1HWm+FTrR5RVW
         YE7c0lkLqAPhab/LVpQeSrP4I/z30ZaXDHMQRRDMoA+IrZkWjIIg+RESBeYZRreihmcQ
         sU/w==
X-Forwarded-Encrypted: i=1; AKwUvBywxxGcQgR4GyWH/x02IfmvuVQy/n11dtjQru4NUeY+0Z3bNWbJIGilOnMPC0sp4wRIDOrHRMDJhinGPA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRilL3ZFh3MKb3blRG2GJ+/dU0eM87ntPNClJgFWUNTMbpNDIg
	esF0mNvsZyTnlCHv04eViNzmFKE5dnVMg6RCASAzFgG4ZJl3hBRDTtLO
X-Gm-Gg: AYBFou3oBAssYIApUv4MJygzQoinVjowhQcMlj0Ln7iIB6za8IxiNNNUMf2c4KE0G2g
	mA322UE+iSpYJV2Ab6R75rcRrutJFLUqm5XGS3bectkUwUQrQ0+i2g/X4+GQ1q42mwbjrJOaPOo
	5dP2ESMfbJ3S3QxsHu95n7jxcFIPJIPBANy7QS36fVlekl9ruOgo/7RmkjNwMsUTVY+oWfUvTxs
	OKBbCJILXfz13WgR9QSaLca3N6m/buem1zUhqtlKXB+fYWGlOxidACQEG6PaL4vf6a/vZLMyKgS
	bFQ68FMW9KJoPPClxogUwyLA+QjSClTyQBmnNfwnkdtZasTvOEX7cf+y/NI5bVlA3UWvvw6ksDn
	QRGLGMT7DjQG8Jms3P31/WztsALlQzHHjoBo8+jUR9VvnThFLcknSUvvG2xatI3zOtDp89rDxeX
	w1v2niqY273JVIFUDQ3hlRuBoBn+/4JJIdh4YCS4Ep9JFeSTKtQVG1j7hcL8lNC/tt9wdVUZH47
	vQH5k0bN9UZ+j7VcHsssw+SpdvGA3jb1l42HtAUhReAoWjKJpdl2K6F071kC6DvRqfmFt2Jve8a
	HEUqWk8KGBbaAn3I
X-Received: by 2002:a17:902:f68d:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2ea9c69710dmr55298395ad.22.1793024842080;
        Mon, 26 Oct 2026 07:27:22 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2300:286:8580:7ae4:15b1:705])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121725sm17638495ad.14.2026.10.26.07.27.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 07:27:20 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] xsk: defer software checksum until the skb is complete
Date: Mon, 26 Oct 2026 22:27:05 +0800
Message-Id: <20261026142705.4564-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <at82NLzM7g8HGgum@boxer>
References: <20261024091256.17918-1-testwrzwrz@gmail.com> <20261024141157.59301-1-testwrzwrz@gmail.com> <20261024141157.59301-2-testwrzwrz@gmail.com> <at82NLzM7g8HGgum@boxer>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maciej,

Thanks for the review.

Yes. xsk_skb_metadata() is only called for the first descriptor when
skb is NULL; continuation fragments do not call it. So
skb->ip_summed == CHECKSUM_PARTIAL means the first fragment requested
the checksum.

I'll preserve unlikely() around pool->tx_sw_csum like this:

    static int xsk_skb_sw_csum(struct sk_buff *skb,
                               struct xsk_buff_pool *pool)
    {
            if (unlikely(pool->tx_sw_csum &&
                         skb->ip_summed == CHECKSUM_PARTIAL))
                    return skb_checksum_help(skb);

            return 0;
    }

For the drop path: xsk_drop_skb() increments tx_invalid_descs and
consumes the skb; sendto() returns the error from skb_checksum_help().
Since the descriptors are already consumed, retrying is not useful. The
current metadata validation makes the malformed-packet path effectively
unreachable, so this is a defensive drop.

I verified the propagation in a local QEMU test kernel. For the test
only, I temporarily changed xsk_skb_sw_csum() to:

    static int xsk_skb_sw_csum(struct sk_buff *skb,
                               struct xsk_buff_pool *pool)
    {
            if (unlikely(pool->tx_sw_csum &&
                         skb->ip_summed == CHECKSUM_PARTIAL))
                    return -EINVAL;

            return 0;
    }

and ran test_xdp_metadata. It failed at the first generate_packet()
sendto:

    generate_packet:FAIL:sendto unexpected sendto: actual -1 < expected 0
    Summary: 0/0 PASSED, 0 SKIPPED, 1/0 FAILED
    TEST_RC=1

The normal kernel still passes. The test harness does not print errno,
so I can only state that sendto() returned -1; the injected error was
-EINVAL. I restored the source after the test.

Magnus suggested a distinct counter for malformed packets. I agree that
would be more precise than tx_invalid_descs, but I'd prefer to do that
in a separate patch instead of extending the UAPI in this stable fix.

I'll address the remaining feedback and send v3 as a new thread.

Thanks,
Rongzheng
