Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387876;
	b=ARMgYfrt9ayuexUyfNAv93tk+RKY50ZWvXP4/5Tg3cHhOsx68JhRsOzeA5Z1h8GoyVNe
	 mBOI3yyrVfuplybz32d/Y/ycbifnX2yUZMlJ1RFmJyaDme8joX06oKl0IP1kys6b5H+Pb
	 f9nTX6+30DX4aKCnfsot4xjmQQk+rIAiJjrCf3BF7Qx3/QOfzFjAyI+MekDyzrUq42k6S
	 BSl2h55Tvox6FE/B/MEQATPNamOixPJHf6m1dQdedkbYBuxvEDQNAyPAmVoGHd05OWYFa
	 6cYyUp7iWZ8w0e10goR1SDfC+RuO5fzrK4T5++VaFtT7eHO9dfyjOHiMPZE+rn0nN5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387876;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tw4MBR2nQ4JcguOEhZ8yHA2Hq3NkQmlLl/rKAtx4S0s=;
	b=LLY4BMjBclB9cOML2jQXz6VGk9HWIeNLQbPzDPP5GX3lkpOo/tLvaqBz0KjDtb3GVMqP
	 H6HMA0Dd0e9zsfzL0xpPSNB4Q/MQ5zuBVByMKUWV6/rFfFGlnbNTmnyYSlBpv4479CJnA
	 rSFH2jG5636mQERPCfXNcWPX4osuJ7IgikmP3xYqNyF0sVWnysjeuuMeXrfjhzDHKVo9I
	 m7yXyqzrt5TxeXqq/9MvKA6l4uWsUqUxAXxjiH2HgTYzDNoYdpaSK9s/djySHwWUok7Nj
	 DLl+l3LXuwm5b705mbNHL4MjvbT7l/+kmGaT0hnf3puxJGNNmZsLH2hb7q/CSzLlBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iv03Gpb+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B445606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iv03Gpb+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9A01F00A05;
	Wed, 11 Nov 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794387876;
	bh=tw4MBR2nQ4JcguOEhZ8yHA2Hq3NkQmlLl/rKAtx4S0s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=iv03Gpb+7C2wrp/t27Vm3RLLSiGGsDKF3a4nqKWoODyAXYYjUodMgi7sdJ+XnKg2y
	 ho69VqOHH+V1GoJro9Zng3pMAIopvTLx0Ex3O8csRNN6JnLgL274bpa5KiGZy+TKfy
	 N3OEx+tntYllVgL31SjxZSdxJe41wllqq10PV/kgOfENQBVgBEVOR9nbx0BJLEF5NX
	 VRu0Co3S/W7f4hI9jESyiFvFIVzDdiRSqgkk/YjvgjWaJVqOe8cfUlWze2qkhL7DNT
	 XFUI7TNkttPp+A9w3ntbAuj7oNbN2OeZtBK2vO6feDnX9zJTWIscY8x9xxkaBnXUkU
	 HUYMBRc1HM6KQ==
Message-ID: <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org>
Date: Wed, 11 Nov 2026 17:04:33 +0800
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
Cc: chao@kernel.org, jaegeuk@kernel.org, yi.sun@unisoc.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated
 blocks
To: Seongjae Jeong <jsjlee1020@gmail.com>
References: <20261004061007.7433-1-jsjlee1020@gmail.com>
 <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
 <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/26 18:39, Seongjae Jeong wrote:
> Hi Chao,
> 
>> Cc stable.
>>
>>> Fixes: 81ffbd224e5f ("f2fs: update_sit_entry_for_release() supports consecutive blocks.")

Hi Seongjae,

Oh, sorry, it seems original Fixes line is correct, my bad.

81ffbd224e5f ("f2fs: update_sit_entry_for_release() supports consecutive blocks."):

-       if (unlikely(!exist)) {
-               f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr);
-               f2fs_bug_on(sbi, 1);
-               se->valid_blocks++;
-               del = 0;


+               if (unlikely(!exist)) {
+                       f2fs_err(sbi, "Bitmap was wrongly cleared, blk:%u", blkaddr + i);
+                       f2fs_bug_on(sbi, 1);
+                       se->valid_blocks++;
+                       del += 1;

The patch changed from "del = 0" to "del += 1" incorrectly.

-       if (!f2fs_test_bit(offset, se->ckpt_valid_map))
-               se->ckpt_valid_blocks += del;
+               if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+                       se->ckpt_valid_blocks -= 1;
+       }

And from "se->ckpt_valid_blocks += del" to "se->ckpt_valid_blocks -= 1".

Let me know if I missed anything. :)

Thanks,

>>
>> This commit didn't change previous logic? IIUC.
> 
> The discard bitmap handling already existed before this commit. It was
> introduced
> by a66cdd985532 ("f2fs: introduce discard_map for f2fs_trim_fs").
> 
> However, 81ffbd224e5f did change the checkpoint accounting.
> Previously, del was set to 0 when the cur_valid_map bit was already cleared,
> so se->ckpt_valid_blocks += del left the counter unchanged.
> That commit replaced this logic with se->ckpt_valid_blocks -= 1,
> regardless of the del value.
> Thus, the counter is incorrectly decremented.
> 
> Would it make sense to add a second Fixes tag for a66cdd985532 to cover
> the discard bitmap handling?

