Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136792;
	b=HqmGSaKEAsvvclKim1uuHzPr8JuH7Ledp0+Wp94ekTouUmvq2I6ux+oNa/DXeuqZ3NWG
	 espZfbXjTHH4bTEO3wwBg8Jbm9HS+wxa0AnbL+3b/tKogfrjAMG7Yrm+tY07TLmkmnNK/
	 xFmQ5DfF+Vbt9ApaIsVD6qSZKr2UtIDy71+5SJSCZTMRNPfRRwRUclFkI6LnjeBOVG+6V
	 MJouRchuK5un9ug9s8RHQrzedYkLecQrjW5xwMhsyk2E2OivgY6QgD8r6/+4IR07xyDLd
	 WWko3qilR4e7QTc9+8cfiuHA8E4wF9SU1bnfVw3LLmFLbgvmmSFL1nhnq1HBlbWOlbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136792;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:DKIM-Signature;
	bh=YprbfqYF/5IHF7LNRQfGp7VZBBSU82RcpHjz3gqg6n0=;
	b=An4rNMknVrerftD9P1ky5Waz4ZJk8ASvsg+p+0qmRbLwfLPNJUdPoyGjPyk+WLrvQZbO
	 ez8nZRnhqh+wvrAp5DWvgHKtgjJ4BlOigKkQu/QeqWPGhlisOKLnN3PRFN2OZdpdlnOXi
	 c+YycnQ3/+agXgXc5tU+hM2Lba7CQWOrDY9Z0owtjxGppqI5VM9XpYN8I7e/bK/8KwmDv
	 0Uq90G9dxolr0I4S9ALu2f9639xEZdkegrTnfO/VY95POQR6tQZPyvyEq9K5pEID0Wfwy
	 mS9fRQdGGymmYFADDkzwAXBWL4coNN/EFZ0e7yMAiUc+KgI27AnLRolQqNtUkiE6ASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=cJliREQ1;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465AC606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 465AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=cJliREQ1
Received: from [192.168.2.228] (p5dc557da.dip0.t-ipconnect.de [93.197.87.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B36174C442F7D2;
	Tue, 27 Oct 2026 22:32:44 +0100 (CET)
Message-ID: <75709eb7-6ff8-44ce-9f0c-84ff47c6ba22@molgen.mpg.de>
Date: Tue, 27 Oct 2026 22:32:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Don't warn about vendor infoframe for
 non-infoframe sinks
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Wentao Liang <vulab@iscas.ac.cn>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261027185414.162183-1-pmenzel@molgen.mpg.de>
 <ba77a6b8-f79c-496f-ad45-9314ac8f8a46@amd.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ba77a6b8-f79c-496f-ad45-9314ac8f8a46@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1793136765; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=YprbfqYF/5IHF7LNRQfGp7VZBBSU82RcpHjz3gqg6n0=; 
	b=cJliREQ1/t9kRei5RaG7Rqav8PcSgbImQ+jzkSCpmYc4D0rkcZgCr/oQUk7i1uRQOssCZLmvuUTI
	Rz9hI0ig4Ab7aFEilxaX7c5flmjuY5ydu+Fzjlr5BjA8hV+lm04pHq/0sYjDLyIY/hBsEBF5VJJ6u4
	4YyxaSCfWsd8TbL/ZmiWCgd8E6ijdbIHDlMI72tFt/29H3W4yBmZKkyuONI+73mP6io/QywKn2ACUW
	wWcp/TyjdWndQ+L1c4YrR/wd5vWvfYC/16G2f9X8cA2XhTyMJFfoow3bDGOIdEIFK24eMZS+DlrJ66
	FlVpa3vCWc+8DNUclHEs9xKyT1TIoGtw==

Dear Mario,


Thank you for you reply.

Am 27.10.26 um 21:48 schrieb Mario Limonciello:
> 
> 
> On 10/27/26 13:54, Paul Menzel wrote:
>> With an EIZO EV2781 connected over HDMI to an AMD Ryzen 3 2200G (Raven)
>> on an MSI B350M MORTAR (MS-7A37), Linux logs at every boot since v6.16:
>>
>>      amdgpu 0000:30:00.0: [drm] Failed to setup vendor infoframe on 
>> connector HDMI-A-1: -22
>>
>> Commit 6027cbee1900 ("drm/amd/display: Add error check for avi and
>> vendor infoframe setup function") started to log the return value of
>> drm_hdmi_vendor_infoframe_from_display_mode(). With `frame` and `mode`
>> being non-NULL, the helper only fails with -EINVAL, if the sink does
>> not support HDMI infoframes, that means, if
>> `connector->display_info.has_hdmi_infoframe` is false, and its
>> kernel-doc says, that this error can be safely ignored.
>> drm_parse_hdmi_vsdb_video() only sets `has_hdmi_infoframe`, if the HDMI
>> VSDB has HDMI_Video_present set, and drm_parse_hdmi_forum_scds() sets
>> it for sinks with an HF-SCDB. So an HDMI sink, whose VSDB lacks
>> HDMI_Video_present, triggers the warning, although nothing failed.
>>
>> The EIZO EV2781 is such a sink. Its HDMI VSDB has a payload of only
>> seven bytes (source physical address, Supports_AI, and a maximum TMDS
>> clock of 250 MHz), so the byte with HDMI_Video_present is absent, and
>> the EDID has no HF-SCDB:
>>
>>      67 03 0c 00 10 00 80 32
>>
>> Only warn, if the sink supports HDMI infoframes. The infoframe setup
>> itself is unchanged.
>>
>> Fixes: 6027cbee1900 ("drm/amd/display: Add error check for avi and 
>> vendor infoframe setup function")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5025
>> ---
>>
>> Notes:
>>
>> claude-opus-5-5 (Claude Code) assisted in analysis, code change and
>> commit message.
>>
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)

[…]

> The actual change looks reasonable to me.  But a few things about your 
> commit message you'll need to change.
> 
> 1) You are missing a S-o-b [1]

Sorry, overlooked.

> 2) Disclosing LLM should currently be done by
> "Assisted-by: LLM" [2]

Since commit 1e035297ffdadf (docs: remove Assisted-by references) it 
seems to be deprecated:

$ scripts/checkpatch.pl 
0001-drm-amd-display-Don-t-warn-about-vendor-infoframe-fo.patch
[…]
WARNING: Non-standard signature: Assisted-by:
#35:
Assisted-by: LLM

ERROR: Unrecognized email address: 'LLM'
#35:
Assisted-by: LLM

I wanted to send v3 with the tag added, but would refrain from it now, 
if that’s alright with you.


Kind regards,

Paul


> https://docs.kernel.org/process/coding-assistants.html#signed-off-by- 
> and-developer-certificate-of-origin [1]
> https://docs.kernel.org/process/coding-assistants.html#attribution [2]
