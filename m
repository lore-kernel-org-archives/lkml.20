Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792714653;
	b=BDwv63E79vK1J7cVa8c2sk/OxDK33spPvA8NUL0aKnah8OGlm4Mf9M4JUawd3oRXJwyK
	 5Mr6eKFVtpeVU/EdoE4Tlo1CVnp3SSI1lYOqA37dc358cE5iSkidYSGUkbJPkGl2cmRNe
	 S0gpuQ5zkwkgth4U/atBjdpBXphTfrJhdr6swz71dVdFlo9jWE0TnDTltfG42jLBWm4a7
	 x/SkIRoJmOBAuRdfkid3/tRM0fOmjftHJhaKrl0pZar99GkeHmOu/TVYGxaKtQXeUvgsz
	 Vd/pzPVug4qE9L1vH/xcbvo36QI6iM+fghpsSQIxNOSTeuJe17CW2Z0u0O8Yn8zMxIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
	b=Gsc6sy2ek8xIAxX9bCC+EMFIMj+tr3xlnpKN8ADTZPl06l65rQ7jtELLt73ZO5M4/SpL
	 jv34O9VPJNAQUDimE42OiUnbkhI7sa1drA27tR4pILafzKcTlsC2sHSvxANO8sCdUUPgX
	 b0E384XPuuJmVAENXQjCwXfpYsA/Pr8CRQyJ36TnIppLTiXTmi2WbrOWsL8OW+sVvh381
	 KPsnlYkkjTpPNEQrbDRRcl7LWNEuRzLu7AbvUNB79dbhVExSENyMNQRStNFGz5am5ftEh
	 1gw5I2LxXW2g0Jrxw7vjRFvEyB0K5/1D6rmWfGrpceChfJDtkhUL62zGy2+tmqzTa8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="D/JQQ3ni";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A456606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A456606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=D/JQQ3ni
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679334baa1fso428326d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792714652; cv=none;
        d=google.com; s=arc-20260327;
        b=H9kM1taBjkLf0INo/6mDAPWK2TuL8P06TetSyJVz9WF0GHooSJ3aLfEXGxHAXdD0h5
         Kmkvf9pvjS9xB5nddKwfcIR7CpiJ9mezsEFUO81y1RWSOcHoxao1tYYJYtm/YXSSPQz8
         SEUO8h951FY82SErgkCCXmj294dV3YltLwjR6cJqrUVGIvS/a+Cq+If5+sbgwJYc9aVf
         RUnORL42N98zHDU8eAetrJKHG/nQf813zTrzISn0NJ14sSXR4sD6zJmyc8iuPFVz0BHh
         oTr5SWjs8MIjNWuxg/vMvlLn+juRlngVWcmj8lvXzZpkhtdVP+OtpYq1r8eKKrv9F1Ma
         E/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
        fh=6oVN33j/j+JAA9gWx0ohl7we//PnfGWQJyE5E2rJsHo=;
        b=axlBp8tlMyRbVNEG2HiwfjGo0bZ8ohBbRTj1okp3t3/xyEDLjqgSdUkFxndsgoJclO
         31UbwMKhY9UqB2C+sDCOyYigjqQ3ECFqtMGZF6YNuLEDo5x0MDY1sL+NkEO1nky5mlFi
         bfNoDFPwFIpPtCTyzfKRDidiFIr/p/tsNfMTYzgN5ynnL6FyC4wjgaXf28WwBytznM5r
         NgbcIss9LGnaFSeOk5sZwGsSa6i8vD4U4PUoFuz0PImgrOLuWt1YrfJc14Wkf7wmqSx4
         z3w7MareMJyqCtwnOYQF/ewMTNCJWqzY0C2QRsVMhPvgDo9WOdstkjmSnTpA4o3ZwEgh
         tiqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714652; x=1793319452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
        b=D/JQQ3nihk7Np7GoQFeNHOxGDY6G70S4JFHnIAviiU9EMAzwyOUKkFexCTGfFB5gW/
         ndA4FsJHVGhj9PtILUmpcqSiAijEYc2Arj0zHP2ZabIj861P8lnvlyTPBwwIIAqwN5Zk
         kXmrnnlPJMXnHSws+b2r9aMaLlUudAMD+fcFwmrUPYXHFzSsTI4iuxfloErORi1wNCj4
         W4Ri8l2CuSLRRUey2R2YMCALiEWi7ec9VeIxJ/WCbWUXL6m/YUCfBc+Ldzc4NFO5DrHB
         pmduBHY9CTgqdUT8HEAO+y2Qdwe+KOMEzXEN5apBvyNsnluO8UFx2o+Y61rHn8BMUqlv
         Zuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714652; x=1793319452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AFG2ImmQoecNeeKEpKd4y7BNHF8UmT+QZFjiG1jtjwI=;
        b=Ucgtnbedcyb+rYu45+/CmU7a9FOQONswUZAR4QeOy11BBOlPiVkyc1DSQ9g5s1VmXV
         6dG/1Sl2MPA8XKqQOljr7n/gGxSIuGSyjJNrhjBQZMAmYZkZJ1IOGAvVY2oBSrmGIoxV
         5QsJ5qWDfOe7qraP8wlbQVnf7ZA9lmYzT7CCvBqUYPLjImQZXPIvhaAOtSVl+6FvrDm4
         WwJjl0KnRV/nV6zTWtgsasiEKkl4dEQBN+raE7ObdCCFUDRa8aWzhd4n584sEpNz+BZm
         Hbx1AbuYu5SzWGHcp9Eob1d0blr//BFUWT0GbjxHqKayqqs2hE6vvjLmv4X/AjVqw7LW
         SymQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2pNigYgKbX6ywZ7WRY0JQvi04x9RB2WpdPt3h40CjrCHEPxaiufiZaZooZ+qyJIBFenqr64Xu9JM2iII=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNjp+bjkKjfKE6Yfq77AiwEWF4nyeDjr8knkJ+2hXxO5L2+I6Y
	6VSbnX6hD25N7Ux3v0j2JvVlGSo8y8L8bdGI7rXpvsELFbBhXrGyiBfsWcdmcNGTnh4gTq5KTe7
	nQEglaAG34V638ToWcTMMM5P+TGWH098WN2Y+HR9z
X-Gm-Gg: AYBFou3ecTxI2BwDWcXIBL1DtQk4BUK9LT4DvPCk1kd5ns3nzks1WcIjW7xU2tG9eRe
	k9F0t5DTAlzuF8WTneDIQYAcYIvOew+/fOvPlZwj1yBV/4cqZPY9D/qvmH1UalTIwlY643Hqtvj
	VPu5Xjqdsw3xd1EzertlPpyi8W2FCBH3u2QbTlbvWi/0AMNqcr7J7H23svja0J2ZvTNDOv12a/O
	ZGeULJazUrW6sEYvkWo0Cqx5iiHp3SalW7fsP0KfrORae+5LhATCpsyOrqtLGck2f0RBXe6I5gm
	aQ88D2FhwOsQ/JQ/psBZPs9/QdwwyYU+Pa1V9m4xN91BpYLnVeGM4g8v5UelSSrgDBtWVsKnPMh
	ubp9lC5GvPtMfequ3PfR8gybsEBLTB8uJjJF9FXrhMVvkN7PEWdZJTF+mwVraMpz6MWr8wHrpIE
	95PKAI2GjQuhjG
X-Received: by 2002:a05:690e:2588:b0:675:5ce8:f03d with SMTP id
 956f58d0204a3-67a35caef75mr332314d50.155.1792714651266; Thu, 22 Oct 2026
 17:17:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com> <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
 <as487H8-0Gc77mXI@ashevche-desk.local> <CAHreonHiesGbR4VB+3sRxoLDmNHXFFEB=6_o6TNedm-N6VksEQ@mail.gmail.com>
 <atXmovzepBLP8Mqo@ashevche-desk.local> <atXnS1ZKGVfHDNEK@ashevche-desk.local>
 <CAHreonFnUSKJMUpR0rmsnSMHEhcJ_W332_NTcGfTKiRkkPse_w@mail.gmail.com> <202610210957562f3f6511@mail.local>
In-Reply-To: <202610210957562f3f6511@mail.local>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Thu, 22 Oct 2026 17:17:20 -0700
X-Gm-Features: AclHuK8M9bVXcyJs5C40xCTHAqMHnBB9g8sqiw9KkWEJQm5LLl14MgBaxmgFDSE
Message-ID: <CAHreonH0maC6iU1fkwv9VvWzZfh=W_ybB8R6CLbXQmKQL+x-=g@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i3c@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> On my side, I believe i3cdev can be added to the kernel and that it is
> way safer than i2cdev but I agree that the ABI has to be properly
> designed, maybe we need to version it or have a way to probe for
> supported features so we can update safely later on. It is failry simple
> right now but I feel like we are going to see people with more needs
> than initiating transfers.

For feature probing and ABI extension, what do you think of:

1. Adding an extensible I3C_IOC_GET_CAPS ioctl:

   struct i3c_ioc_caps {
       __u32 size; /* sizeof(struct i3c_ioc_caps) */
       __u32 pad;  /* must be 0 */
       __u64 caps; /* Bitmask of supported I3C_CAP_* features */
   };

   Today caps can report the transfer modes supported by the controller
   and target (I3C_CAP_SDR, I3C_CAP_HDR_DDR, I3C_CAP_HDR_TSP,
   I3C_CAP_HDR_TSL), and new bits in caps (or new fields appended to
   the end of the struct) can advertise future capabilities beyond basic
   transfers.

2. In struct i3c_ioc_xfer, we already have __u8 pad[2] at the end which
   is strictly checked to be 0 (-EINVAL if non-zero), reserving 16 bits
   for future per-transfer flags without changing the struct size.

> Also, I think this should not bind to any devices by default and make
> binding explicit.

This seems to be the consensus so far. I can convert i3cdev from a bus
notifier into a standard struct i3c_driver so it does not auto-attach
to all unbound targets on boot or on unbind while dropping patches 1
and 2.

Since Greg KH noted earlier [1] that driver_override / manual sysfs
bind is only for debugging and will taint the kernel in the near
future, what do you think of:

Matching explicit opt-in entries in i3cdev's i3c_device_id table (starting
with 0xBD for OCP Secure Firmware Recovery), and optionally
exposing a new_id sysfs attribute on the i3cdev driver for dynamically
adding target IDs at runtime? That also keeps everything self-contained
in i3cdev without needing cross-subsystem changes to hwmon/iio drivers.


[1] https://lore.kernel.org/linux-i3c/2026091834-bats-palpitate-5614@gregkh/


Thanks,
Sam
