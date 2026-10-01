Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E51405C38
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898117; cv=none; b=em4ode1uUUVwYYtj+0T22ibMLgdvjPlVezQKZMPWL+KaDMeFaxfuhhIKEO9uzzUU+PcD1Tn3CpUzYFdujA71c8DsiSZZT8bLzMEPAcvzVvqHoaXb1GtWoBEFmKrcvGeIV6ARF7rWijQtC9gOAizai2PFHbgOKYWyq2VJOt3JmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898117; c=relaxed/simple;
	bh=k8FV0AuY/UnTXAbRfnvFY/B3Ch7+YNxyw8EB7UJBX+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFWzU8KKEG9h17k8yXw3NaDEg1P+etybkY503uS8HqQh5pliTCVTLtqkr4hi1I8lo9PgVwnmIJAiBGhbRhyYeYhDNUe0rIa2MjgJS/GGV19n58yMd3ntePE/VrdGK8/EC12vX8qLzBItMXPhjd/NGyx8h5pxVhFN+SG8UgsvIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZSRXl+z; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZSRXl+z"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so43821345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790898114; x=1791502914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2eHfLXSxsUxHEfJdm6K8VExNqrOwW+s9I9FDdxMVoY=;
        b=GZSRXl+zGEAyAwjkC+sAg1bbC9dc5LWDmYkhWUK5/oaSl34zKmwHL0YNoO6SKjZpnc
         1wzQhpZFzfzdhl+lJiLpaPerEcRQLMfwOk7/3EFZ069BTQXPsJSEXTqTh0MZSRzpqhAx
         6fyuV6P0wl+pHC5bP/edM89m2Hlle5hqjMX4frLQg2FYE1ZMktpMnvN8pA1W3pZUZE8A
         3QBvGA7rHzgxVnCJ2kI4rLOHGGskGzqlpIo8h8pEGY5ZspNTYAV2iTdM+QRE4+rDKMr5
         C3ogMRhomK7JvZEg9eaLY03yKhcm9DVxrEs1fzZR+PtVbZQyFEbRnio11YAarX1Zs4+3
         Xbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790898114; x=1791502914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2eHfLXSxsUxHEfJdm6K8VExNqrOwW+s9I9FDdxMVoY=;
        b=mM27ekgVQGZDhF0qS1vI4RafFsIr7NLlBlBHJSyFisF9hGgJ7GGbsWpAjoTbg2Iy8n
         Jp7UrzuZTubK7LwVfdboeaYJyJGmkwXknLSwvAvfE/Tk/T7ZNZceoTyhyQL/Bo/tOHBN
         GvJp3BfX+LoCdAXroa5YnmOrqcWgF0iu6uEO76LV9JNSokef+7s+bPWQka64lhQiduic
         HnMQBHzljDd4DDrVVE+gFMjSNoFA9jPMoHvsFngw4rXcUErIHOKuOz86jaUkAFP8Zixr
         cPGRBYZ92UDJs+4JYGf3o3rTS7WhrAATIcfwqRoiB1didcXarejNndz/se4rZNlK2sMR
         JZGw==
X-Forwarded-Encrypted: i=1; AKwUvByCZMeu8PKOrUgGzyY1nhuWb3abjlORMX+9Jd1dUP8eFRl2JK8kq8Cg/BTV25bB/6uut5j+vzpVE1pDLJs=@vger.kernel.org
X-Gm-Message-State: AFuF++k4HYYqu72+QQZPdlwnSPJcdZ0tgB8wKBI4I4Krqc6IoIXe7yzA
	0JsUNRvFT7Goa/XH4Kh5YewqInwk5FrHQ7Oxt7s6arOGWqpa4hB+hali
X-Gm-Gg: AYBFou3+qmTsrw7JSUUh1oe2FopxAXJT6G4iwEFfPtdYPbvibp3ibpV+1O/iPK3pbD7
	uvQhv1CXeUibPtNT60oIa1K8A9e3zCz8xxsapD+iPrjWFvtv+I0UT9BYB8NxTYj30q9WjGNfWWW
	uFRMIIVRyxe8n5RJbIIkrPhi8CF4qlL6Os80Ky173rwgSoHUrRLyfZEeZBz012OffraVeNJi1eL
	hzNd3yuFeTq22A8sE/C7HLcHbsubh1olxQ58UcxQ3bBw2wNF8eU4mQ4qABNCxGWO7+9pQREyuuW
	aeQrdDaCsD7UK4r6bGsiZEId88/zHiKa4nA7CdEqtu164U4KeIqAibd7mJr04a/+9cJ33Iby5sv
	w/za5IKK06sO7r74EcKh6SEBpPOtFISIJU3AjlfQnlbFM1FQHX/fcwK+vZRXcIGdYJCpJIOiCMj
	xgsy1opXWmGpf+tmoeDzM7hRS0KzmZggAT5oTW3UTIOinEzzA34WKDmK8fjBieyQt6rvcpCkQk3
	b8o1NO752/wRdn3BugjuS+8HDl08lfboFF8ZG1aSxwmVWCiqyY0vOu9MvRarE3ljvWpEm6HKbYs
	g95zAb5Oj0q0DTe//Aovhsih5GwUjX8b5hpq+6TAU450upsMcIrGMOb2wgnuAh3/BAJCrypzJv4
	P+f1zpyUVfg==
X-Received: by 2002:a05:600c:620c:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a027583fb0mr16121105e9.20.1790898114308;
        Thu, 01 Oct 2026 16:41:54 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b3ca-3a01-3deb-81e4-0dc4-fbe8.310.pool.telefonica.de. [2a02:3100:b3ca:3a01:3deb:81e4:dc4:fbe8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm30779645e9.15.2026.10.01.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:41:53 -0700 (PDT)
Date: Fri, 2 Oct 2026 01:41:51 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	g@mbp-von-karl.localdomain
Cc: linux-wireless@vger.kernel.org, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 contextg
Message-ID: <ar7vLt5kQ2HJoJY9@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261001075755.3MilPS2C@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001075755.3MilPS2C@linutronix.de>

On Thu, Oct 01, 2026 at 09:57:55AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-09-30 20:54:17 [+0200], Karl Mehltretter wrote:
> > This fixes the direct SDIO transmit path used by fcmode=0. Modes 1 and 2
> > take the FWS lock first and need a separate change.
> 
> Is this the only affected driver?

I also reproduced a sleeping-lock warning with 8139cp on PREEMPT_RT
using QEMU's RTL8139C+ device. Enabling a dynamic netconsole target caused
the printer thread to enter cp_start_xmit() with hard interrupts disabled:

  BUG: sleeping function called from invalid context
  in_atomic(): 0, irqs_disabled(): 1, pid: 107, name: pr/netcon0
  hardirqs last disabled at netpoll_send_skb+0x1c8/0x3d0
  rt_spin_lock
  cp_start_xmit+0x31/0x8b6 [8139cp]
  netpoll_start_xmit+0x18e/0x260
  netpoll_send_skb+0x37a/0x3d0
  netconsole_write+0x56d/0x820

That was one reproduction on the netdev base a7bfaba4823e. I have not
established how many drivers are affected.

Source inspection also identified 8139too and macb as candidates: their
transmit paths take ordinary spinlock_t locks. I have not reproduced the
warning with either driver.

The earlier netpoll/NBCON discussion concerns NAPI polling and
scheduler-lock deadlocks, rather than this driver-lock warning:

https://lore.kernel.org/linux-rt-devel/20260618111554.2n0pP_O9@linutronix.de/

> Do you have maybe a backtrace?
> 

This is the original Pi 400 report on 7.3-rc3 with PREEMPT_RT. That kernel
also had unrelated allocation-test patches applied. DEBUG_ATOMIC_SLEEP
was disabled, so this report is the BH-disable warning:

  DEBUG_LOCKS_WARN_ON(this_cpu_read(softirq_ctrl.cnt))
  WARNING: kernel/softirq.c:199 at __local_bh_disable_ip+0xd8/0x200
  CPU#0: pr/netcon0/769
  Call trace:
   __local_bh_disable_ip+0xd8/0x200
   brcmf_sdio_bus_txdata+0x90/0x2b0 [brcmfmac]
   brcmf_proto_bcdc_txdata+0x90/0xb0 [brcmfmac]
   brcmf_proto_bcdc_tx_queue_data+0x60/0xa0 [brcmfmac]
   brcmf_netdev_start_xmit+0x164/0x390 [brcmfmac]
   netpoll_start_xmit+0x160/0x218
   netpoll_send_skb+0x208/0x2b0
   netpoll_send_udp+0x298/0x478
   netconsole_write+0x440/0x7a0
   netconsole_write_basic+0x20/0x40
   nbcon_emit_next_record+0x208/0x2a8
   nbcon_emit_one+0xc8/0x110
   nbcon_kthread_func+0x184/0x210

Thanks,
Karl
