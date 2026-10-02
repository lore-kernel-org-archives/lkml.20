Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5914BD362
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949339; cv=none; b=hv8zDdZVE+1X7Mlax3UTsZLt3jYxidPUHovNC8u0wCv0bpjGFT24mFTvbjDCR+ZPpZSyKINjPZNJE9zPfc7Q7N1cawlJ3HZi19Qp1xZr5rXScxLM0zhdDmaIg0+iv+acgymVk2uKaSEUhZoT8G8j2W3LQ1JkjcYPDrZJhOahwpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949339; c=relaxed/simple;
	bh=NxRWmaItSzHiNP+iJ+lnvfwn/WnhlxFvjpyIKAD7kDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fj+U4nIislhN072y+C6Z5atY/r7EMBzmBm9gaSffFf0XP9AuZOEWMIetqKNf7OC2THBg//kFJsgz4KUoZAsGGf/ArSmTH9vM4LswVQt3ySDRDBT3MA+FgvR6hIFnST4ho7XS3vD3oamF630uT+GHTyz0P6/Wn6+UDCjHNh+rZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=odAhpm1Q; arc=none smtp.client-ip=91.218.175.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="odAhpm1Q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NxRWmaItSzHiNP+iJ+lnvfwn/WnhlxFvjpyIKAD7kDc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790949335; v=1; x=1791554135;
 b=odAhpm1Q1UT068OTbgGiH2kCS22APaDZ44DzAL/Ywkj5xJYRY37NrAn376PGCBnfi+gd9Xor
 sxo3Vmy7hya+rmE+9xtC5bm29vj/ntxP5lJKXg6GnI4RN1yJWCA6xbdE7pFJuaXPxenYV98SPRp
 5PMQ+z2FOtbo0teUvrA+q+6E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f72c8588b31d1e0b;
	Fri, 02 Oct 2026 13:55:29 +0000
X-Mizu-Trace-ID: f72c8588b31d1e0b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so8299e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:55:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgria2ep1E78752PhuHytsNwSiUdCYh3knxbSEJvfoKRgIKd39/9+4P4b9lnh5EPFhjeQd+IOiKs4OSWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBw5dtOZUCvSQ2Buzecnk1SB3BYNQ3bOw2M2DQVNWPKQ6YRpgR
	Tz6PnlqwhNz6caaUg3IjcR7mjDg9JF6VjV6WDxVKtk2ZIcJAgC50FY89H5u3Yc5USQf3tnrcTSv
	JGNcGpiXYyBId+MBFOl9rswtT/vSkrT3ZJPEolA2w
X-Received: by 2002:a05:6512:124e:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5bb7c95878amr126055e87.4.1790949323822; Fri, 02 Oct 2026
 06:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev> <ar-xtsSOqwWK9jWQ@willie-the-truck>
In-Reply-To: <ar-xtsSOqwWK9jWQ@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 2 Oct 2026 14:54:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
X-Gm-Features: AclHuK8F5q6n8ZekSRW4HmigvutSZ6LtavhLlT8nBy_1uvzPoiEI4YC6OWepcRo
Message-ID: <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 02, 2026 at 02:29:26PM +0100, Will Deacon wrote:
> Are you sure #8 is the correct immediate for the ccmp? My reading of the
> pseudocode is that it should be #9, but this instruction has always confused
> me and I hate the fact that it doesn't take another condition code mnemonic
> instead of a raw immediate value.

My read is that #8 is right. From the CCMP (immediate) pseudocode in the
Arm ARM (DDI 0487 M.d, C6.2.81), flags start out as the nzcv immediate
and are only overwritten by the compare when the condition holds:

      var flags : bits(4) = nzcv;
      ...
      if ConditionHolds(condition) then
          ...
          (-, flags) = AddWithCarry{datasize}(operand1, NOT operand2, '1');
      end;
      PSTATE.[N,Z,C,V] = flags;

So when PMUVer == IMP_DEF the ne fails and NZCV = 0b1000, i.e. N=1, V=0.
LT is N != V (Table C1-1), so b.lt is taken and we skip. #9 would give
N=1, V=1, so we'd fall through and set the bits on an IMP_DEF PMU.

Agreed on the raw immediate, it's horrible.

Cheers,
/fuad
