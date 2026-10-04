Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AB13B71BB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116839; cv=none; b=uwvo9qSuQzcP3tDFsMpyJhUz47nRIrKwtwFDRVuv5NG0BOUYSTdtzXM2vs3hg8Y41dadxR6nBpMNKJ4/0WU8lDVJN71Zm9SQR4AdjZrNebIdVh2p2bCuIwkcbebmXobnJ+0JMvDYTdEqVg6Nu2ErKWXbk1HshUJX+81fxKwgCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116839; c=relaxed/simple;
	bh=Y7Xj9NnpcIGXYVCOFJvKI6d7fYesormUC6TqXtwyEbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERBghGl3tj1qcRHzWLNvMP5bzURxw6B8B6hXKf3+usLcW50TEoe2Q/CKFhCdpRcQq8JcElIeEFcRleIMf9zRgUCDixeZj9rI+Kxh3OHVP0LVe7WIQ1+AyW5O/gCeca3BcPnqjneG/E+9k2M578A8RNKiZuKw/LeUOUYdrf9cmWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LojKkFVr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LojKkFVr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a49623b865so421671a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116836; x=1791721636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiHRKqxAONyxrEHhYO6YMGTpd95L6pjr2E4WdfkyOO8=;
        b=LojKkFVrUgHBEq83iWeWOnF2XxOVK2s/tEKZF3L+ksWsOEbmynqa6qfnZtTQPHtrjC
         TF87AK1J/pm1YNhszII62iIeyQxMJege2FlF9YnAM8tLMeKudPbSEsjO0vyJzNUXAfNq
         U8kUSLtjyP6v2SCmUnr0S1uLSqT+uzy4YGEhpUP47ZMtSxLhDM2UdFQFJL7bdbo3kd42
         RP4oFFH5RNc1boFtJ6llwTUlLBRBW2bfLJR5C+J188/FlpN6r9xg+VPeaUOMc3i/rGxf
         KDauaig7RER4Ifr1/rFSoOBjBj7uZtZ8RA1WNpe2iT0rUHfhbdYkZCvf9L2n80dC98un
         XO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116836; x=1791721636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiHRKqxAONyxrEHhYO6YMGTpd95L6pjr2E4WdfkyOO8=;
        b=eRkmLAIh8FSGUz61sEXo2esSWc831zwU1zsfwgknvJLYZp6urEhLGKff5fv1dcoL/T
         JAiXwOYcbI2R/jgQf0AGyi8mHSfkVmEn1fzA6BRzyWJa1iEMDTcsHjLIRFtQ7DVz1LQt
         mjqXA0ZPDoXkr50BJAsjo9Z/P9WZIJZZoCaMAgiz3D5sNywp6FsgGZKbnNN9W0BZLLI2
         ylEXF4W98YV3cvokyORmr55Xh5c/3J6+VCFEU4tUMLKQw3Mil1LssQEie6V9slDSwK+c
         wc2WP4EN25WKon9OIoL+HwJUt8/IbWh+fMJuzMR8kqQJ6sYaJyGv/2z7dmx8MURu3YpG
         rDdg==
X-Forwarded-Encrypted: i=1; AKwUvBxTeiBctVv3m2sOv9yFQvvNVVxGzCPn1Hi9LuKDzp4LsrxNHivx0UmdEROfVZbf94KYHEuQ8ENEEFOVzto=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNWqHDbtaFgCi82HnyPnDdbUEEg82fdhUqg1cBq0kcYBtbMyvM
	oNMLM9g+hdWQLSqKUyC8g2B48JQZP+Si8GUSyPeuIf3ltYSHGn+M8DwlKOsv+g==
X-Gm-Gg: AYBFou27O9v/5BdgoKZT8Dxh/CUOVfBKHCDFlmXve80bxw3C4dp6LOr9K0tHmreJyBL
	0kcQ34exw/6VH9ojaLZy1BiasDSt/YJ9xH79L3FETEjuBzfLZchlhEsAyh63IrgwJ/kDEYC9xdk
	qZRLmivfe6IePvvbGslTi4WcuYFW9jAUzjmgs0gLhfYisiRy15NqylAhaD0iex8HRyWlT6n0hbD
	JUp9cqza48cd7IOlS30WMd49y4cv0Jh0oyqYf/dCyDgSM/3iCi7PVWq2ALwWVpgqxl0HIGT++cM
	rmesMG3CCpBJKXx/dlHuIMW7cBiANJLXjnLlo8HrJe/RIV2iucJH0g/nNMGQTLctbc6exvWK9D6
	Pgl30Hk3yi+8BDAhHEP5cQSh+g1xcmOzbSDwoYOvudhgiklcn9ceaKxBMjQiTJytMdKHKZvX/Hh
	Co6K7sGNfWjsKXJI+IgKNUvKqN8QO2F5SdyZnclweVgtIpa/afMxzEc4nLnbmmbqRxX9leeBodE
	bKnKBYbfiGx5wl4QRJ/J2vyw/gUNqQKG6UEGA3OiEu7+6sr8vC7rA==
X-Received: by 2002:a17:90b:388b:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a78717daaemr3574428a91.18.1791116835699;
        Sun, 04 Oct 2026 05:27:15 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a79a98e7c0sm5282060a91.0.2026.10.04.05.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:27:15 -0700 (PDT)
Message-ID: <02bf1027-41ab-434b-82af-1fc5ee6c7d3c@gmail.com>
Date: Sun, 4 Oct 2026 21:27:13 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] docs/ja_JP: translate submitting-patches.rst
 (review and report tags)
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20260910011432.710551-1-weibu@redadmin.org>
 <20261002060157.223645-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261002060157.223645-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Fri,  2 Oct 2026 15:01:57 +0900, Akiyoshi Kurita wrote:
> Translate the section describing Reported-by, Tested-by, Reviewed-by,
> Suggested-by, and Fixes tags into Japanese.
> 
> This includes the Reviewer's Statement and the guidance on adding or
> removing review and testing tags in subsequent patch versions.
> 

I think it is worth mentioning the following point here in Changelog.

   - Keep the Reviewer's Statement in English and add a Japanese
     tentative translation in a formal style.

> Keep the Japanese submitting-patches documentation aligned with the
> corresponding English section.

Probably, this part has become redundant now and can be removed.

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> 
> Changes in v2:
> 
>   - Use "レビューア" consistently for "reviewer".
>   - Keep the Reviewer's Statement in English and add a Japanese
>     tentative translation in a formal style.
>   - Reword the Reported-by description as suggested.
>   - Use a file-local reference for "変更内容を記述する".
>   - Drop the duplicate tagging_people label.
> 
> 
>  .../ja_JP/process/submitting-patches.rst      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 797b70b97fa7..dfc5500f420d 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -573,3 +573,119 @@ Acked-by:、Cc:、Co-developed-by: を使用する場合
>      Signed-off-by: From Author <from@author.example.org>
>      Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
>      Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
> +
> +
> +Reported-by:、Tested-by:、Reviewed-by:、Suggested-by:、Fixes: の使用
> +---------------------------------------------------------------------
> +
> +``Reported-by:`` タグは、バグを発見して報告した人の功績を示すものであり、
> +今後も再び協力してもらうきっかけになることが期待されます。このタグは
> +バグを対象としています。機能追加の要望に対する功績を示すためには
> +使用しないでください。報告が Web 上で参照できない場合を除き、
> +``Reported-by:`` タグの後には、その報告を指す ``Closes:`` タグを
> +付けてください。報告された問題の一部だけを修正するパッチの場合は、
> +``Closes:`` の代わりに ``Link:`` タグを使用できます。なお、
> +``Reported-by:`` は、名前を記載される本人の明示的な許可なしに
> +使用できる可能性がある三つのタグのうちの一つです。詳細については、
> +後述の「人をタグ付けするには許可が必要」を参照してください。
> +
> +``Tested-by:`` タグは、記載された人が（何らかの環境で）パッチを
> +正常にテストしたことを示します。このタグは、何らかのテストが
> +実施されたことをメンテナーに知らせ、将来のパッチでテスターを
> +探す手段を提供するとともに、テスターの功績を記録します。
> +
> +一方、``Reviewed-by:`` は、パッチがレビューされ、以下の
> +レビューアの声明に従って受け入れ可能と判断されたことを示します。
> +
> +Reviewer's statement of oversight
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +By offering my Reviewed-by: tag, I state that:
> +

This is from the original in pre-v7.3.  See below.

> +        (a) I have carried out a technical review of this patch to
> +            evaluate its appropriateness and readiness for inclusion into
> +            the mainline kernel.
> +
> +        (b) Any problems, concerns, or questions relating to the patch
> +            have been communicated back to the submitter.  I am satisfied
> +            with the submitter's response to my comments.
> +
> +        (c) While there may be things that could be improved with this
> +            submission, I believe that it is, at this time, (1) a
> +            worthwhile modification to the kernel, and (2) free of known
> +            issues which would argue against its inclusion.
> +
> +        (d) While I have reviewed the patch and believe it to be sound, I
> +            do not (unless explicitly stated elsewhere) make any
> +            warranties or guarantees that it will achieve its stated
> +            purpose or function properly in any given situation.
> +

Please use the one later than commit 83f71fbc66fb ("docs:
submitting-patches: Fix section structure around DCO") and fix
subsection structure. 

> +.. note::
> +
> +   〖試訳〗
> +
> +   **レビューアによる確認声明**
> +
> +   ``Reviewed-by:`` タグを付けることにより、私は以下を表明する。
> +
> +   (a) このパッチがメインラインカーネルへの取り込みに適切であり、
> +       その準備が整っているかを評価するため、技術的なレビューを
> +       実施した。
> +
> +   (b) パッチに関する問題、懸念、または質問はすべて提出者に
> +       伝えられている。私は、自分のコメントに対する提出者の
> +       回答に満足している。
> +
> +   (c) この提出物には改善できる点が残っている可能性があるが、
> +       現時点において、(1) カーネルに対する価値のある変更であり、
> +       かつ (2) その取り込みに反対する理由となる既知の問題が
> +       存在しないと考える。
> +
> +   (d) 私はこのパッチをレビューし、妥当であると考えているが、
> +       別途明示されていない限り、そのパッチが記載された目的を
> +       達成すること、またはいかなる状況においても正しく動作する
> +       ことについて、いかなる保証も行わない。
> +

And please make your tentative translation a "literal block".
I mean, something like:

.. note:: 

   〖試訳〗 ::

	レビューアによる確認声明

	Reviewed-by: タグを付けることにより、私は以下を表明する。

        [...]

You need to remove all reST markups in the literal block.

BTW, using "確認声明" for "statement of oversight" can depart from
the original.  I'd say "監督声明" to indicate the two-way nature of
"oversight/overseeing".  "確認" can mean one-sided action.

> +``Reviewed-by:`` タグは、そのパッチが重大な技術的問題を残していない、
> +カーネルに対する適切な変更であるという意見を表明するものです。
> +必要なレビューを行った既知の身元を持つ人であれば、関心のある
> +レビューアは誰でもパッチに ``Reviewed-by:`` タグを付けられます。
> +このタグは、レビューアの功績を示すとともに、どの程度のレビューが
> +行われたかをメンテナーに知らせる役割を果たします。対象分野を理解し、
> +十分なレビューを行うことで知られているレビューアが付けた
> +``Reviewed-by:`` タグは、通常、パッチがカーネルに取り込まれる
> +可能性を高めます。
> +
> +``Tested-by:`` と ``Reviewed-by:`` の両方のタグは、メーリングリスト上で
> +テスターまたはレビューアから受け取った後、次のバージョンを
> +送信するときに、作者が該当するパッチへ追加する必要があります。
> +ただし、次のバージョンでパッチが大幅に変更された場合は、これらのタグが
> +適用できなくなる可能性があるため、削除する必要があります。
> +通常、誰かの ``Acked-by:``、``Tested-by:``、または ``Reviewed-by:`` タグを
> +削除した場合は、その理由をパッチの変更履歴で説明する必要があります
> +（``---`` 区切りの後）。
> +
> +``Suggested-by:`` タグは、パッチのアイデアが記載された人によって
> +提案されたことを示し、そのアイデアに対する功績を記録します。
> +アイデアを提案した人の功績をきちんと記録すれば、今後も再び協力して
> +もらうきっかけになることが期待されます。なお、これは、名前を
> +記載される本人の明示的な許可なしに使用できる可能性がある三つの
> +タグのうちの一つです。詳細については、後述の
> +「人をタグ付けするには許可が必要」を参照してください。
> +
> +``Fixes:`` タグは、そのパッチが以前のコミットにあるバグを修正する
> +ことを示します。これは、問題がどこで発生したのかを容易に特定できる
> +ようにし、バグ修正のレビューに役立ちます。また、このタグは stable
> +kernel チームが、どの stable kernel バージョンに修正を適用すべきかを
> +判断する際にも役立ちます。パッチが修正するバグを示す方法としては、
> +これが推奨されています。詳細については `変更内容を記述する`_ を
> +参照してください。
> +
> +注意: ``Fixes:`` タグを付けても、stable kernel rules の手順や、
> +stable 向けパッチ候補すべてで ``Cc: stable@vger.kernel.org`` を
> +指定する要件がなくなるわけではありません。詳細については、
> +Documentation/process/stable-kernel-rules.rst を参照してください。
> +
> +最後に、タグを付けることは歓迎され、通常は非常にありがたいものですが、
> +署名者（すなわち、提出者およびメンテナー）は、提示されたタグを
> +適用するかどうかを自身の判断で決めることができます。
> 
> base-commit: d793bcfca6bb493eb8e93900285f951a0c9dbf7c

Finally, Please post a new version of your patch as an independent
patch (series).  That would help those who use b4 in applying your
patch(es).

Thanks, Akira
