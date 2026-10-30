Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347072;
	b=nExwr4i0W+bU91L49qpWMit8x5zsoP45drENJoqX50Da248qOUH0pkRbtG89Djaj5yeQ
	 +Im7OEyYUS11mS/PCM/YiFLWdmsvk5sjlBvOjNPfSN4/ZXD5qUQoFwjaYMTqT5k9A6gOt
	 3y8hps3EQ7BqymuZQhkHX6KIpAOuqECSrlB3OttaBJTAhW6CAZj3oPBUdXj2VszSmNo3p
	 wX+4w07v1g7hj+CP8FIvyl22Id2XJk22RKXsafvjDPkzDyZkFO1GempHqb7c9O4DaGiP+
	 32ivhvLqeK13LyIaBZHhcuGiWKHaHOcQEdhmTbCCOr2wUSqGkbNGh85mvA0ycCBlOtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UeMFe59C+6CGb+6QO+mNSCypQcnt2mUVBf/74RZRjcg=;
	b=mTgjxlrK0Eiz7A1neIit/xRI4nQxjrNW4vW5LWhmUvtrrpEmhQU8rAWH6rZBkJJ7wBJK
	 L1JlT6IxfxiIsAJr1kdg96NS5BCC0sTuyV0EoC7RvFubTLJ3vfVI9UKCBYaxqpm8/lhYN
	 3vvj347LkEsAth41qEAJuK5AJPULO3xtdIrp5+sUQtfra5v9tFT6/EjGwKruKPxnVsRMo
	 +jcS1NbyRDuqS0YBlnLj3TRnWhsAIGS9n6qDzhljoXPOASDMXZR2Qbl/NDFx5k1fIAWNL
	 VDK6MWG+pypFLQVaxIchrQ9IFYg0QB5V0nZFlVEnATahLx6YDbk0AQP/DOSA9HEUNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=paugg4K5;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BA606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D6BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=paugg4K5
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so162861f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347071; x=1793951871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeMFe59C+6CGb+6QO+mNSCypQcnt2mUVBf/74RZRjcg=;
        b=paugg4K56y/LQwEnbFQts4oXymCk549ELgld7CxfmgqQWHcOnpLlPV1R/Di1qwNQ8w
         rE6DwPDHFYFS/UF7YpSMPKKk7y8efap1/zu8P/ShgHECQBHs5BbK/TvXDde4wwWXAy4D
         eyD7LsxqYl7nDlbnqoTtY7JcB1OiRI8XBNZ+1mLkCucRBuh64urbCdT1kzQ4621+5eAx
         XdrbqbsUR6xcva9NaZlceR+fEx+fD70DaGL7kUOkqs/ogNzvj5aOOoDYTUIBdt2bE67A
         1S54npxkVHvCbZueFIDOd3EbxZFXOqKZsmucmrPUKCd43J9aBq+FkL0fgndAU0bDODqD
         pGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347071; x=1793951871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeMFe59C+6CGb+6QO+mNSCypQcnt2mUVBf/74RZRjcg=;
        b=ucVqLNM1zsny9lRCmnUpsLcotIDrvW4ZNxDetr7+C9scO3njJySVaS58Rnq7Emp3bN
         5CzbVbxeBSfs3oX0clD4avLAlUzai2e1D7c8w7aSnSbNgxo8FdjaIDgkVg4oXNZmrMn5
         HZW/2iXz1Xyxx8Kk18H5EVkAyTC+m1aqrciQFwdKoHC/qClIhIankDfTSrHpHIEWIFFg
         UZBU4M1rUnMDCHSWlQH2HqOra2h1pg5OQRvHDrfwec8PIDU+BqR1w4ULHVT9N4Qwh1dL
         D3VkxG/ovpPtPuje42IgafW/FaguV4BGKl7+g8/Vzo9ZCR0s93cOws5A+CX2mkb3Z6lG
         8MxA==
X-Forwarded-Encrypted: i=1; AKwUvBxR4u5HRVTwyiQBVWK6SGjov9kWgcz1M2kUacOLynrAmaP38Z92d8eU7i1E8MNJ8SlwycnzK5KdfO3uCnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6JxV9i56N9/MRE0Kwasufy8U4fqyVBMuJr9G0ssqCpyH/xQpH
	BOdT/ISt+UnLhkxitGZ/0UO/ibXqa7MYlhNJZhLQbbMFZJpAxANinJRPbXbvu/Rn4Q==
X-Gm-Gg: AYBFou3NarY7wzQJE5E35gn5CiiJ/ls52XFQv9A86wcZiKAEHQfbsYcjH3KVPA9jW8o
	qdonpqINYUY6hlzZtymmk976ohjoSDSra6x8rPiZ3+qPsuDtO0jNDheGgtoZ2npVRZi6+lQ+M45
	U017g4pdM2hzCIXWskLzHlVFRAfF8gT54weMwwWcKXVYCnAU7ZVCi67SXq8ESs8xg0HlAaLmMyw
	RovkyZZXPRkI7EEurODslAuu/Nh1nYk6JUwxdp+mlecZYn/mPWRv3jMjVucRpHYxNlZaWI+MWzr
	qMLbA3YUkmpZK/4RmWrm5OsGtIn0ILvRyBVi8fjs9tGJDwFeIWwT6UAbfUDyTfQo6L1HDgvpFLW
	yisez4OZ6+ODc7du2DiFZSiuJGgAc2OxdT2D44KifL1flriJv5iir34lJdSK1Y9DaZ2Uzqa8ESE
	x40aCFSEheFXQAxdVdyfEkPg+DzcIHgOBzfFY9b/dVkiemH+5Kn9lWjaAnkvufSDRKMEGet+ojH
	NEKIDPAGYpwp+vpIl9ZlEc8LcjO8+MJrfWL0VWhxB+1DSkRv0CkQXna0QRpFmZZWdmD0OmHyMlk
	/EwhvKSBvJzxFMrp6mMz8C23bbnmnsK48L1/BTsbVEN1rwOU7Su77cLdqa8jBAHnu0xHxsvP9V/
	F
X-Received: by 2002:a5d:588e:0:b0:48e:6bbb:c3f3 with SMTP id ffacd0b85a97d-48e6e2fd071mr3556678f8f.28.1793347070787;
        Fri, 30 Oct 2026 00:57:50 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm1676007f8f.42.2026.10.30.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:57:50 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Mario Limonciello <superm1@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: amd-gfx@lists.freedesktop.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/amdgpu: handle broken dGPU hotplug GPE on ASUS ROG Strix G513QY
Date: Fri, 30 Oct 2026 07:57:43 +0000
Message-ID: <20261030075743.356835-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8072db9e-0df4-4fc5-b86a-cc50ac7934a9@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 29 Oct 2026, Mario Limonciello wrote:
> Can you please get an acpidump and put it on a kernel bugzilla or drm
> bug?  This generally feels like an ACPI interpreter issue to me.

Done: https://gitlab.freedesktop.org/drm/amd/-/work_items/6061

It has the errors and the tables from /sys/firmware/acpi/tables, minus my
local override SSDT.  I haven't got acpidump or iasl installed so it's the
raw files in a tarball rather than a real acpidump, I can redo it if you
want the proper format

On the interpreter question: _L05 is only Notify (\_SB.PCI0.GPP0.VGA,
0x81), and \_SB.PCI0.GPP0.VGA doesn't exist on this board, the dGPU is
under GPP0.SWUS.SWDS.VGA_.  I don't know what the interpreter is meant to
do with a Notify to a path that doesn't resolve, which is why I put the
question in the bug.  Rafael, if there's a better place for it I'll move it

Mike
