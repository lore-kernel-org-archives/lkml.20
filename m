Received: from mail-wr2-f23.google.com (mail-wr2-f23.google.com [74.125.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD574FDA4E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862062; cv=none; b=q6RiS5C0TlAi/C2MJCDEPOVs84C2xz89C9YfYNKDUNafvo1IQ73J496il2y1NCVew0CTw4m840YHrV7lPlTE+PFRwQuYtS4MKpSkqQU9lDvc2uL9pJ0v5Vo+Ezvx2HXyDM+XGbM3Xgd5T/W/g6Lj8NX7gMiKhFVaulBRKFQafcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862062; c=relaxed/simple;
	bh=jSF6sckf2CdykpIyTHyIXc502TuC2NL74BfAZtOKhK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0gACU/X/YHuR/Ei7ALZkaxYxSwGZdPIVq01Cpegz1V81pzhEUHeq3Yh1xpjJVcq0MyUJ/Of8rzRy3+UipPgYMnV6fWgD7JCwG1OQ6UU+9Jdv2iqddj/09epCOnJY5KBgAvEj1prZ+AiYAGmuDWie+E43F6AlVwdVeUqUI2fbHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=exp965j+; arc=none smtp.client-ip=74.125.225.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="exp965j+"
Received: by mail-wr2-f23.google.com with SMTP id ffacd0b85a97d-48b0622cc90so640128f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790862057; x=1791466857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGqLF1Rm/hEU75zgoHWcWsfF1Mh1p1AKwwc942QTcEk=;
        b=exp965j+dK9d3Gg6mjmXjj64N8SdLOy+ZO3GDm6KuE6rw9tKEECr6wmASJdpi7W+A/
         X1vof8aRgStYFZTE9Dnqt+0uSPx7g655K+vzr0LvkZF5qV67VZnkXVnnaYARmlEj75nX
         ljbntdkA8J3v/FpBR2KA1vB9xIisyPDceWiKFoNsmV7ugiEyRoKO9BazcrAMJaGIUPNu
         Y4XAR4SHh9QDwqol+bU2O030hn2Qk44gRWDi9lXA1T9cehmU8Pprdh1OOV2zb0YPUP4S
         HNUHFt/SgkuRX7/no6zQ+uvTatXpJ1rDOWX1+CDt24vc4a6p8pm/i+PlatQSEKTKPZlD
         d9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862057; x=1791466857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGqLF1Rm/hEU75zgoHWcWsfF1Mh1p1AKwwc942QTcEk=;
        b=uiZZj0Ou16yET2YV/rEJ5jmgeWN82d8rRkqcYB9NUg4PznK8c9yjLDKLnUhXTmgr8M
         eROGmUoJIRSVGVuuPJcvF69r3sBQGDKo5P/H8h7vvwgLGvXkk/r/5DzuH2ShtGj6WkFQ
         AaqjBwVv8012VIw64xYj2tqIGim81efnFbvL9/1qXuH9e/i7OK1H9ASxJWcofWm4u57h
         C3fst6k1VKVy/f2MnFB9ycWFPDwUBs8guKWqgoQGz9XNTqVU/Vc9XjztDvW6+J8xdcmy
         /tl5C7wtdNYWU1GWOBeUWNIaXtAeq5S70m6pNuTGAcUNr3/ePgYjCU8OyXTGpjs3KGdN
         fu0g==
X-Forwarded-Encrypted: i=1; AKwUvBylVfJ8SP8gkZ38k28zCOhs/GynvrOYzwgv/a6+sfO4AmuM5tPzlDQbC+7wt9hOIw8SSIx/t6l0EWlsWq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLClmtaKrRf7YBQHypEyXl45DFK1bq85+8dtM5EXeExjpzmk6SM
	AEVxE6dqSjYP0n3vjsIMbPx2eWp3kXEO9DVD3xOZdzm3Q6lS+9rzwfduolQvQjqYaIk=
X-Gm-Gg: AYBFou2Y+cNRgAoO70MJLllxhFsFTAQYI1ywekIbNt+5CygG+tRT4iSz+MzmUfPcagC
	LCnsf2drKfXwppCFTrTUJm0kGRhdiRxAustwtb3tuLtfKFMR75lzlKIS2Bob43Qo7OXQesYb6ba
	kPaTqDzMp3oCXXU+aQ5OElgi/5OiCKB+CwGpy5P4D2o4qHGaa679+AEdIFW6De/BgrxkjYnFLy4
	XvtUiiiIa8/vrMlbZNzDovHP5l/o0FZfWdGIYXMJrVA8Zk4sFoTVeRodW7uUEW1Vi3bHD0RO8FD
	Uz/5s9qKfAOqVTFacBvY6M2PkwwdloKYecgfgUsgSGzJXEOQildkFRt6vErfdgBBHLiiEdEUDwG
	VM7mqWT5IHgKkruy2nt3T8y0UQxfcZXpbax5eW6lyN9bdFxzzBby6yqASXAWdtYyINBruChgCCL
	moQcX44h4Glro9wKRAOrxZVSj7p+4CEbY0F3xIVT7XQYVGBhDRXtHN5teK0xipH0fmL2I7qpYwE
	aGWpQHEo92JUGSicb3UjRrDXksojFlvKbM=
X-Received: by 2002:a05:6000:3101:b0:48a:f318:ac03 with SMTP id ffacd0b85a97d-48b02505291mr8094664f8f.25.1790862057220;
        Thu, 01 Oct 2026 06:40:57 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691d681sm5667084f8f.23.2026.10.01.06.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:40:56 -0700 (PDT)
Message-ID: <2ce83a44-c85f-4e3d-ba47-fa07a1663253@suse.com>
Date: Thu, 1 Oct 2026 15:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917051147.98775-1-tweek@google.com>
 <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/30/26 2:13 PM, Miguel Ojeda wrote:
> On Thu, Sep 17, 2026 at 7:11 AM Thiébaud Weksteen <tweek@google.com> wrote:
>>
>> Module authors may have non-ASCII characters in their names. In C,
>> `MODULE_AUTHOR` allows arbitrary string literals which are emitted as
>> raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
>> modules use non-ASCII author names.
>>
>> Originally, the single `author` field permitted arbitrary string literals
>> including non-ASCII characters. When support for multiple authors was
>> introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
>> key"), it reused the `expect_string_array` helper that had originally been
>> added for module aliases. Because that helper enforced an ASCII check,
>> `authors` inadvertently became restricted to ASCII-only string literals.
>> Later, when the macro parsing was rewritten to use `syn` in commit
>> c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
>> restriction was carried over by using AsciiLitStr in `authors` type.
>>
>> Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
>> to `LitStr` so that UTF-8 author names are permitted.
>>
>> Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
>> Signed-off-by: Thiébaud Weksteen <tweek@google.com>
> 
> This looks good, thanks! We did discuss allowing non-ASCII long ago,
> so this wasn't intentional.
> 
> Petr & modules: I can pick this on up (an Acked-by would be nice!),
> unless you want to pick it.

Acked-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
